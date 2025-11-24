import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

/// Provider que retorna o usuário autenticado
final authUserProvider = Provider<User?>((ref) => supabase.auth.currentUser);

/// Provider que retorna o ID do usuário autenticado
final authUserIdProvider = Provider<String?>(
  (ref) => supabase.auth.currentUser?.id,
);
