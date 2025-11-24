import 'package:contata_aqui/src/features/chat_room/data/chat_room_model.dart';
import 'package:contata_aqui/src/features/message/data/message_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

// Provider para lista de salas para cliente
final chatRoomsForClientProvider =
    StreamProvider.family<List<ChatRoomModel>, String>((ref, clientId) {
      final supabase = ref.read(supabaseClientProvider);
      return supabase
          .from('chat_room')
          .stream(primaryKey: ['id_chat_room'])
          .eq('client_id', clientId)
          .order('updated_at', ascending: false)
          .map(
            (maps) =>
                maps
                    .map(
                      // ignore: unnecessary_cast
                      (m) => ChatRoomModel.fromJson(m as Map<String, dynamic>),
                    )
                    .toList(),
          );
    });

// Provider para lista de mensagens para uma sala
final messagesForRoomProvider =
    StreamProvider.family<List<MessageModel>, String>((ref, roomId) {
      final supabase = ref.read(supabaseClientProvider);
      return supabase
          .from('message')
          .stream(primaryKey: ['id_message'])
          .eq('chatroom_id', roomId)
          .order('sent_at', ascending: true)
          .map(
            (maps) =>
                maps
                    .map(
                      // ignore: unnecessary_cast
                      (m) => MessageModel.fromJson(m as Map<String, dynamic>),
                    )
                    .toList(),
          );
    });

// Serviço para enviar mensagem
class SendMessageService {
  final Ref _ref;

  SendMessageService(this._ref);

  Future<void> sendMessage({
    required String roomId,
    required String senderType,
    required String senderId,
    required String content,
  }) async {
    final supabase = _ref.read(supabaseClientProvider);
    await supabase.from('message').insert({
      'chatroom_id': roomId,
      'sender_type': senderType,
      'sender_id': senderId,
      'content': content,
    });
    await supabase
        .from('chat_room')
        .update({'updated_at': DateTime.now().toUtc().toIso8601String()})
        .eq('id_chat_room', roomId);
  }
}

final sendMessageServiceProvider = Provider<SendMessageService>((ref) {
  return SendMessageService(ref);
});
