import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'chat_room_model.dart';

part 'chat_viewmodel.g.dart';

final supabase = Supabase.instance.client;

const chatRoomColumns = '''
id_chat_room, client_id, professional_id, created_at, updated_at
''';

Future<List<ChatRoomModel>> fetchChatRoomsForClient(String clientId) async {
  final response = await supabase
      .from('chat_room')
      .select(chatRoomColumns)
      .eq('client_id', clientId)
      .order('updated_at', ascending: false);

  return (response as List)
      .map((json) => ChatRoomModel.fromJson(json))
      .toList();
}

@riverpod
FutureOr<List<ChatRoomModel>> chatRoomsForClient(
  Ref ref,
  String clientId,
) async {
  return await fetchChatRoomsForClient(clientId);
}
