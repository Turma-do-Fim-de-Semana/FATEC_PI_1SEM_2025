import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

Future<bool> becomeClient(String userId) async {
  // Verifica se já existe cadastro de cliente
  final existing =
      await supabase.from("client").select().eq("id", userId).maybeSingle();

  if (existing != null) {
    return false; // Já é cliente
  }

  // Buscar dados do profissional para copiar
  final professional =
      await supabase
          .from("professional")
          .select("name, email, password")
          .eq("id_professional", userId)
          .maybeSingle();

  if (professional == null) {
    return false;
  }

  // Inserir dados do cliente
  await supabase.from("client").insert({
    "id": userId,
    "name": professional["name"],
    "email": professional["email"],
    "password": 'NULL',
    "is_client": true,
  });

  return true;
}
