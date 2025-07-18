import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'app_providers.g.dart';

@riverpod
SupabaseClient supabaseClient(Ref ref) {
  return Supabase.instance.client;
}
