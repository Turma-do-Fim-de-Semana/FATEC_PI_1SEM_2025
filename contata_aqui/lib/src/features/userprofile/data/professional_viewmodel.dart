import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'professional_model.dart';

part 'professional_viewmodel.g.dart';

final supabase = Supabase.instance.client;

// Campos que realmente queremos retornar do banco
const professionalColumns = '''
id_professional, name, phone, email, description, cep, address, city_state,
latitude, longitude, image, category_id, schedule, is_provider,
created_at, updated_at
''';

Future<List<ProfessionalModel>> fetchProfessionals() async {
  final response = await supabase
      .from('professional')
      .select(professionalColumns)
      .order('name');

  return (response as List)
      .map((json) => ProfessionalModel.fromJson(json))
      .toList();
}

@riverpod
FutureOr<List<ProfessionalModel>> professionals(Ref ref) async {
  return await fetchProfessionals();
}

@riverpod
FutureOr<List<ProfessionalModel>> professionalsByCategory(
  Ref ref,
  String categoryId,
) async {
  final response = await supabase
      .from('professional')
      .select(professionalColumns)
      .eq('category_id', categoryId)
      .order('name');

  return (response as List)
      .map((json) => ProfessionalModel.fromJson(json))
      .toList();
}

@riverpod
Future<ProfessionalModel> professionalById(
  Ref ref,
  String professionalId,
) async {
  final response =
      await supabase
          .from('professional')
          .select(professionalColumns)
          .eq('id_professional', professionalId)
          .maybeSingle();

  if (response == null) {
    throw Exception('Profissional não encontrado com id: $professionalId');
  }

  return ProfessionalModel.fromJson(response);
}
