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
  const ChatScreen({super.key, required this.room});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  late final chat_core.InMemoryChatController _chatController;
  late final String _currentUserId;
  late final String _senderType;
  bool _initialized = false;

  String? _otherName; // 🔹 Nome da outra pessoa

  @override
  void initState() {
    super.initState();
    _chatController = chat_core.InMemoryChatController();

    final uid = ref.read(authUserIdProvider);
    _currentUserId = uid ?? '';
    _senderType =
        (widget.room.client_id == uid)
            ? 'client'
            : (widget.room.professional_id == uid)
            ? 'professional'
            : '';

    if (_currentUserId.isNotEmpty && _senderType.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await _loadInitialHistory();
        await _loadOtherUserName(); // 🔹 Carrega o nome do contato
      });
    }
  }

  @override
  void dispose() {
    _chatController.dispose();
    super.dispose();
  }

  /// 🔹 1) Carrega histórico inicial
  Future<void> _loadInitialHistory() async {
    final supabase = ref.read(supabaseClientProvider);

    final response = await supabase
        .from('message')
        .select()
        .eq('chatroom_id', widget.room.id_chat_room)
        .order('sent_at', ascending: true);

    // ignore: unnecessary_type_check
    if (response is! List) return;

    final mapped =
        response.map((m) {
          final sentAt = m['sent_at'];
          return chat_core.TextMessage(
            id: m['id_message'],
            authorId: m['sender_id'],
            createdAt:
                (sentAt is String)
                    ? DateTime.parse(sentAt).toUtc()
                    : DateTime.now().toUtc(),
            text: m['content'] ?? '',
          );
        }).toList();

    if (mapped.isNotEmpty) {
      await _chatController.insertAllMessages(mapped, animated: false);
      _chatController.scrollToIndex(
        mapped.length - 1,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    }

    setState(() => _initialized = true);
  }

  /// 🔹 2) Carrega o nome da pessoa com quem estamos falando
  Future<void> _loadOtherUserName() async {
    final supabase = ref.read(supabaseClientProvider);

    final otherId =
        (widget.room.client_id == _currentUserId)
            ? widget.room.professional_id
            : widget.room.client_id;

    // tenta cliente primeiro
    final c =
        await supabase
            .from('client')
            .select('name')
            .eq('id', otherId)
            .maybeSingle();

    if (c != null) {
      setState(() => _otherName = c['name']);
      return;
    }

    // tenta profissional
    final p =
        await supabase
            .from('professional')
            .select('name')
            .eq('id_professional', otherId)
            .maybeSingle();

    if (p != null) {
      setState(() => _otherName = p['name']);
      return;
    }

    setState(() => _otherName = "Usuário");
  }

  /// 🔹 Resolve nome para exibir nos balões
  Future<chat_core.User> _resolveUser(chat_core.UserID id) async {
    final supabase = ref.read(supabaseClientProvider);

    final c =
        await supabase
            .from('client')
            .select('id, name')
            .eq('id', id)
            .maybeSingle();
    if (c != null) return chat_core.User(id: id, name: c['name']);

    final p =
        await supabase
            .from('professional')
            .select('id_professional as id, name')
            .eq('id_professional', id)
            .maybeSingle();
    if (p != null) return chat_core.User(id: id, name: p['name']);

    return chat_core.User(id: id, name: 'Usuário');
  }

  @override
  Widget build(BuildContext context) {
    if (_currentUserId.isEmpty || _senderType.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Chat"),
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
        ),
        body: const Center(child: Text("Usuário não autorizado nesta sala")),
      );
    }

    /// 🔹 STREAM — atualiza mensagens em tempo real
    if (_initialized) {
      ref.listen<AsyncValue<List<MessageModel>>>(
        messagesForRoomProvider(widget.room.id_chat_room),
        (_, asyncValue) {
          asyncValue.when(
            data: (msgs) {
              final known = _chatController.messages.map((e) => e.id).toSet();
              final fresh =
                  msgs
                      .where((m) => !known.contains(m.id_message))
                      .map(
                        (m) => chat_core.TextMessage(
                          id: m.id_message,
                          authorId: m.sender_id,
                          createdAt:
                              m.sent_at?.toUtc() ?? DateTime.now().toUtc(),
                          text: m.content ?? '',
                        ),
                      )
                      .toList();

              if (fresh.isNotEmpty) {
                _chatController.insertAllMessages(fresh, animated: true);
                _chatController.scrollToIndex(
                  _chatController.messages.length - 1,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                );
              }
            },
            error: (e, _) => debugPrint("Erro stream: $e"),
            loading: () {},
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_otherName ?? "Chat"), // 🔥 Nome da pessoa no AppBar
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Chat(
          chatController: _chatController,
          currentUserId: _currentUserId,
          resolveUser: _resolveUser,

          /// 🔹 Mensagem aparece imediatamente antes do realtime
          onMessageSend: (txt) async {
            final service = ref.read(sendMessageServiceProvider);

            await service.sendMessage(
              roomId: widget.room.id_chat_room,
              senderType: _senderType,
              senderId: _currentUserId,
              content: txt,
            );

            final temp = chat_core.TextMessage(
              id: UniqueKey().toString(),
              authorId: _currentUserId,
              createdAt: DateTime.now().toUtc(),
              text: txt,
            );

            _chatController.insertMessage(temp);
            _chatController.scrollToIndex(
              _chatController.messages.length - 1,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
            );
          },
        ),
      ),
    );
  }
}
