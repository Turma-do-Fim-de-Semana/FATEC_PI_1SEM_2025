import 'package:contata_aqui/src/features/chat_room/presentation/chat_list_screen.dart';
import 'package:contata_aqui/src/features/index/presentation/profissional_home_screen.dart';
import 'package:flutter/material.dart';

class ProfissionalMainNavigation extends StatefulWidget {
  const ProfissionalMainNavigation({super.key});

  @override
  State<ProfissionalMainNavigation> createState() =>
      _ProfissionalMainNavigationState();
}

class _ProfissionalMainNavigationState
    extends State<ProfissionalMainNavigation> {
  int _index = 0;

  final pages = const [ProfissionalHomeScreen(), ChatListScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: '',
          ),
        ],
      ),
    );
  }
}
