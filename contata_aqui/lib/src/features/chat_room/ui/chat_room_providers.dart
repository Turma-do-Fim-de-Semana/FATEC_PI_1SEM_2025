// lib/src/features/chat_room/data/chat_room_providers.dart
import 'package:contata_aqui/core/app_providers.dart';
import 'package:contata_aqui/src/features/chat_room/ui/chat_room_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contata_aqui/src/features/chat_room/data/chat_room_model.dart';

final chatRoomsUIProvider = FutureProvider.family<List<ChatRoomUI>, String>((
  ref,
  userId,
) async {
  final supabase = ref.read(supabaseClientProvider);

  // pegar todas salas onde o usuário participa
  final rooms = await supabase
      .from('chat_room')
      .select()
      .or('client_id.eq.$userId,professional_id.eq.$userId');

  List<ChatRoomUI> result = [];

  for (final r in rooms) {
    final room = ChatRoomModel.fromJson(r);

    final otherId =
        (room.client_id == userId) ? room.professional_id : room.client_id;

    // buscar nome e imagem do outro usuário
    final prof =
        await supabase
            .from('professional')
            .select('id_professional, name, image')
            .eq('id_professional', otherId)
            .maybeSingle();

    final client =
        await supabase
            .from('client')
            .select('id, name')
            .eq('id', otherId)
            .maybeSingle();

    final displayName =
        prof != null ? prof['name'] : client?['name'] ?? 'Usuário';

    final avatarUrl = (prof != null) ? (prof['image'] as String?) : null;

    // pegar última mensagem
    final lastMsgRes = await supabase
        .from('message')
        .select()
        .eq('chatroom_id', room.id_chat_room)
        .order('sent_at', ascending: false)
        .limit(1);

    String lastMsg = "Comece a conversar 🎬";
    DateTime? lastTime;

    if (lastMsgRes.isNotEmpty) {
      final m = lastMsgRes.first;
      lastMsg = m['content'] ?? lastMsg;
      lastTime = DateTime.tryParse(m['sent_at'] ?? "");
    }

    result.add(
      ChatRoomUI(
        room: room,
        displayName: displayName,
        avatarUrl: avatarUrl,
        lastMessage: lastMsg,
        lastMessageTime: lastTime,
      ),
    );
  }

  // ordenar pela última mensagem
  result.sort((a, b) {
    final ta = a.lastMessageTime ?? DateTime(1990);
    final tb = b.lastMessageTime ?? DateTime(1990);
    return tb.compareTo(ta);
  });

  return result;
});
