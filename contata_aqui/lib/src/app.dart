import 'package:flutter/material.dart';

import 'features/auth/presentation/login_screen.dart';
import 'features/auth/presentation/register_screen.dart';
import 'features/index/presentation/index_screen.dart';
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
        '/index': (context) => IndexScreen(),
        '/contactlist': (context) => ContactListScreen(),
        '/user': (context) => UserScreen(),
      },
    );
  }
}
