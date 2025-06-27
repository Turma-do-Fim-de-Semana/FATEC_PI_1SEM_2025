import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  bool _loggedIn = false; // Novo estado para saber se já logou
  late final TextEditingController _emailController = TextEditingController();
  late final StreamSubscription<AuthState> _authStateSubscription;

  Future<void> _signIn() async {
    try {
      setState(() {
        _isLoading = true;
      });

      await Supabase.instance.client.auth.signInWithOtp(
        email: _emailController.text.trim(),
        emailRedirectTo:
            kIsWeb ? null : 'io.supabase.flutterquickstart://login-callback/',
      );

      if (mounted) {
        _showMessage('Check your email for a login link!');
        _emailController.clear();
      }
    } on AuthException catch (error) {
      if (mounted) _showMessage(error.message, isError: true);
    } catch (error) {
      if (mounted) {
        _showMessage('Unexpected error occurred', isError: true);
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();

    _authStateSubscription = Supabase.instance.client.auth.onAuthStateChange
        .listen(
          (data) {
            final session = data.session;
            if (session != null) {
              setState(() {
                _loggedIn = true;
              });
              _showMessage('You are logged in!');
              // Aqui você pode criar o registro na tabela client, se precisar
            }
          },
          onError: (error) {
            if (error is AuthException) {
              _showMessage(error.message, isError: true);
            } else {
              _showMessage('Unexpected error occurred', isError: true);
            }
          },
        );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _authStateSubscription.cancel();
    super.dispose();
  }

  void _showMessage(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        child:
            _loggedIn
                ? const Center(
                  child: Text(
                    'You are logged in!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
                : ListView(
                  children: [
                    const Text(
                      'Sign in via the magic link with your email below',
                    ),
                    const SizedBox(height: 18),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 18),
                    ElevatedButton(
                      onPressed: _isLoading ? null : _signIn,
                      child: Text(
                        _isLoading ? 'Sending...' : 'Send Magic Link',
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}
