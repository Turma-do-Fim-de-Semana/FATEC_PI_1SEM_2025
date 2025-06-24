import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:contata_aqui/src/features/userprofile/data/professional_model.dart';

part 'professional_viewmodel.g.dart';

final supabase = Supabase.instance.client;

Future<List<ProfessionalModel>> fetchProfessionals() async {
  final response = await supabase.from('professional').select();

  if (response.isEmpty) {
    return [];
  }

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
      .select()
      .eq('category_id', categoryId);

  if (response.isEmpty) {
    return [];
  }

  return (response as List)
      .map((json) => ProfessionalModel.fromJson(json))
      .toList();
}
