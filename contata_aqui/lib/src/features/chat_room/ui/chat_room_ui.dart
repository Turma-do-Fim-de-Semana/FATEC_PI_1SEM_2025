// lib/src/features/chat_room/data/chat_room_ui.dart
import 'package:contata_aqui/src/features/chat_room/data/chat_room_model.dart';

class ChatRoomUI {
  final ChatRoomModel room;
  final String displayName; // Nome do usuário exibido
  final String? avatarUrl; // Imagem (quando disponível)
  final String lastMessage; // Última mensagem (ou placeholder)
  final DateTime? lastMessageTime; // Horário da última mensagem

  ChatRoomUI({
    required this.room,
    required this.displayName,
    this.avatarUrl,
    required this.lastMessage,
    this.lastMessageTime,
  });
}
