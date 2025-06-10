import 'package:flutter/material.dart';
import 'src/app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://zzvdnfwamqbbjwbsfjap.supabase.co',
    anonKey: '7pjUkqYqMa*!4?u',                
  );

  runApp(App());
}
