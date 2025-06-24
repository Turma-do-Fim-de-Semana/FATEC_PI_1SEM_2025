import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://zzvdnfwamqbbjwbsfjap.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inp6dmRuZndhbXFiYmp3YnNmamFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDg1NDU0NDksImV4cCI6MjA2NDEyMTQ0OX0.JMKBhmHGg4ZGksqTQglGkKv96gA4oFyDmKe4nlIxVPE',
  );

  runApp(ProviderScope(child: App()));
}
