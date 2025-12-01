//chat_list_screen.dart
import 'package:contata_aqui/src/features/chat_room/ui/chat_room_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contata_aqui/src/features/auth/data/auth_provider.dart';
import 'package:contata_aqui/src/features/message/presentation/chat_screen.dart';

class ChatListScreen extends ConsumerWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = ref.watch(authUserIdProvider);
    if (uid == null) {
      return const Center(child: Text("Usuário não autenticado"));
    }

    final rooms = ref.watch(chatRoomsUIProvider(uid));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Conversas"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: rooms.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text("Erro: $e")),
        data: (rooms) {
          if (rooms.isEmpty) {
            return const Center(child: Text("Nenhuma conversa encontrada"));
          }

          return ListView.separated(
            itemCount: rooms.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final ui = rooms[index];

              return ListTile(
                leading: CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.orange.shade200,
                  backgroundImage:
                      (ui.avatarUrl != null)
                          ? NetworkImage(ui.avatarUrl!)
                          : null,
                  child:
                      ui.avatarUrl == null
                          ? const Icon(Icons.person, color: Colors.white)
                          : null,
                ),
                title: Text(
                  ui.displayName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  ui.lastMessage,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing:
                    ui.lastMessageTime != null
                        ? Text(
                          _format(ui.lastMessageTime!),
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade600,
                          ),
                        )
                        : null,
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatScreen(room: ui.room),
                    ),
                  );
                  ref.invalidate(chatRoomsUIProvider(uid));
                },
              );
            },
          );
        },
      ),
    );
  }

  String _format(DateTime dt) =>
      "${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}";
}
