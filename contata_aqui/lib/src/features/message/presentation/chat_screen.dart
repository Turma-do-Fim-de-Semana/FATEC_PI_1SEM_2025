// lib/src/features/message/presentation/chat_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart' as chat_core;

import 'package:contata_aqui/src/features/auth/data/auth_provider.dart';
import 'package:contata_aqui/src/features/message/data/chat_providers.dart';
import 'package:contata_aqui/src/features/chat_room/data/chat_room_model.dart';
import 'package:contata_aqui/src/features/message/data/message_model.dart';

class ChatScreen extends ConsumerStatefulWidget {
  final ChatRoomModel room;
  // ignore: use_super_parameters
  const ChatScreen({Key? key, required this.room}) : super(key: key);

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  late final chat_core.InMemoryChatController _chatController;
  late final String _currentUserId;
  late final String _senderType;

  @override
  void initState() {
    super.initState();
    _chatController = chat_core.InMemoryChatController();

    final String? userId = ref.read(authUserIdProvider);
    if (userId == null) {
      _currentUserId = '';
      _senderType = '';
    } else {
      _currentUserId = userId;
      if (widget.room.client_id == userId) {
        _senderType = 'client';
      } else if (widget.room.professional_id == userId) {
        _senderType = 'professional';
      } else {
        _senderType = '';
      }
    }
  }

  @override
  void dispose() {
    _chatController.dispose();
    super.dispose();
  }

  Future<chat_core.User> _resolveUser(chat_core.UserID id) async {
    final supabase = ref.read(supabaseClientProvider);
    final clientRes =
        await supabase
            .from('client')
            .select('id, name')
            .eq('id', id)
            .maybeSingle();
    if (clientRes != null) {
      return chat_core.User(id: id, name: clientRes['name'] as String);
    }
    final profRes =
        await supabase
            .from('professional')
            .select('id_professional as id, name')
            .eq('id_professional', id)
            .maybeSingle();
    if (profRes != null) {
      return chat_core.User(id: id, name: profRes['name'] as String);
    }
    return chat_core.User(id: id, name: 'Usuário');
  }

  @override
  Widget build(BuildContext context) {
    if (_currentUserId.isEmpty || _senderType.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Chat'),
          backgroundColor: Colors.orange,
        ),
        body: const Center(
          child: Text('Usuário não autorizado ou não pertence a esta sala'),
        ),
      );
    }

    ref.listen<AsyncValue<List<MessageModel>>>(
      messagesForRoomProvider(widget.room.id_chat_room),
      (previous, asyncMessages) {
        asyncMessages.when(
          data: (messages) {
            _chatController.setMessages([]); // ou limpe, conforme API
            for (final msg in messages) {
              final textMessage = chat_core.TextMessage(
                id: msg.id_message,
                authorId: msg.sender_type,
                createdAt: msg.sent_at?.toUtc() ?? DateTime.now().toUtc(),
                text: msg.content ?? '',
              );
              _chatController.insertMessage(textMessage);
            }
          },
          loading: () {},
          error: (err, _) {
            debugPrint('Erro carregando mensagens: $err');
          },
        );
      },
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Chat'), backgroundColor: Colors.orange),
      body: SafeArea(
        child: Chat(
          chatController: _chatController,
          currentUserId: _currentUserId,
          onMessageSend: (String text) async {
            final sendService = ref.read(sendMessageServiceProvider);
            await sendService.sendMessage(
              roomId: widget.room.id_chat_room,
              senderType: _senderType,
              senderId: _currentUserId,
              content: text,
            );
          },
          resolveUser: _resolveUser,
        ),
      ),
    );
  }
}
