import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'message_model.dart';

part 'message_viewmodel.g.dart';

final supabase = Supabase.instance.client;

const messageColumns = '''
id_message, chatroom_id, sender_type, sender_id, content, sent_at, read_at
''';

// ---------- FETCH MESSAGES ----------
Future<List<MessageModel>> fetchMessagesByRoom(String chatRoomId) async {
  final response = await supabase
      .from('message')
      .select(messageColumns)
      .eq('chatroom_id', chatRoomId)
      .order('sent_at', ascending: false);

  return (response as List).map((json) => MessageModel.fromJson(json)).toList();
}

// ---------- SEND MESSAGE ----------
class MessageViewModel {
  Future<void> sendMessage({
    required String chatRoomId,
    required String senderType,
    required String senderId,
    required String content,
  }) async {
    final res = await supabase.from('message').insert({
      'chatroom_id': chatRoomId,
      'sender_type': senderType,
      'sender_id': senderId,
      'content': content,
    });

    if (res.error != null) {
      throw Exception(res.error!.message);
    }
  }
}

// ---------- PROVIDERS ----------

@riverpod
FutureOr<List<MessageModel>> messagesByRoom(Ref ref, String chatRoomId) async {
  return await fetchMessagesByRoom(chatRoomId);
}

@riverpod
MessageViewModel messageViewModel(Ref ref) {
  return MessageViewModel();
}
