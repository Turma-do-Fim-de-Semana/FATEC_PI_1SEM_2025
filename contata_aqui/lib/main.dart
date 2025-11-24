import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://umcanshevldwuwelnkez.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVtY2Fuc2hldmxkd3V3ZWxua2V6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjI4MDMxMTgsImV4cCI6MjA3ODM3OTExOH0.q8UbJbHYCw3_09SriMsO01opWr4FveNfS8btrUxBM2A',
  );

  runApp(ProviderScope(child: App()));
}
