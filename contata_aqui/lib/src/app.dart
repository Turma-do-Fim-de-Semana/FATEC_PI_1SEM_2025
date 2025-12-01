import 'package:contata_aqui/src/features/chat_room/data/chat_room_model.dart';
import 'package:contata_aqui/src/features/chat_room/presentation/chat_list_screen.dart';
import 'package:contata_aqui/src/features/index/widgets/custom_nav_bar.dart';
import 'package:contata_aqui/src/features/index/widgets/profissional_main_navigation.dart';
import 'package:contata_aqui/src/features/message/presentation/chat_screen.dart';
import 'package:flutter/material.dart';

import 'features/auth/presentation/login_screen.dart';
import 'features/auth/presentation/register_screen.dart';
import 'features/contactlist/presentation/contact_list_screen.dart';
import 'features/userprofile/presentation/user_profile_screen.dart';
import 'features/auth/presentation/recover_screen.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contata Aqui',
      theme: ThemeData(primarySwatch: Colors.amber, fontFamily: 'Arial'),
      home: LoginScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/recover': (context) => PasswordResetScreen(),
        '/register': (context) => RegisterScreen(),
        '/choose_role': (_) => Placeholder(),
        '/index': (context) => CustomNavBar(),
        '/profissional_home': (context) => ProfissionalMainNavigation(),
        '/contactlist': (context) => ContactListScreen(),
        '/chat_list': (context) => ChatListScreen(),
        '/chat_screen': (context) {
          final args = ModalRoute.of(context)!.settings.arguments;
          if (args is ChatRoomModel) {
            return ChatScreen(room: args);
          } else {
            return const Scaffold(body: Center(child: Text('Sala inválida')));
          }
        },
        '/user': (context) => UserScreen(),
      },
    );
  }
}
