import 'package:contata_aqui/src/features/auth/data/auth_provider.dart';
import 'package:contata_aqui/src/features/index/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contata_aqui/src/features/chat_room/data/chat_viewmodel.dart';
import 'package:contata_aqui/src/features/chat_room/data/chat_room_model.dart';

class ChatListScreen extends ConsumerStatefulWidget {
  const ChatListScreen({super.key});

  @override
  ConsumerState<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends ConsumerState<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    final String? userId = ref.watch(authUserIdProvider);

    if (userId == null) {
      return const Scaffold(
        body: Center(child: Text("Usuário não autenticado")),
      );
    }

    final chatRoomsAsync = ref.watch(chatRoomsForClientProvider(userId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversas'),
        backgroundColor: Colors.orange,
      ),
      body: chatRoomsAsync.when(
        data: (rooms) {
          if (rooms.isEmpty) {
            return const Center(child: Text('Nenhuma conversa disponível.'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: rooms.length,
            itemBuilder: (context, index) {
              final ChatRoomModel room = rooms[index];
              return ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: Text("Profissional: ${room.professional_id}"),
                subtitle: const Text("Toque para abrir conversa"),
                onTap: () {
                  Navigator.pushNamed(context, '/chat_screen', arguments: room);
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Erro ao carregar: $err')),
      ),
      bottomNavigationBar: const CustomNavBar(currentIndex: 0),
    );
  }
}
