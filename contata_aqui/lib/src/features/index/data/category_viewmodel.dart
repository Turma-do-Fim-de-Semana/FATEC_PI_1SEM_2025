import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:contata_aqui/src/features/index/data/category_model.dart';

part 'category_viewmodel.g.dart';

final supabase = Supabase.instance.client;

Future<List<CategoryModel>> fetchcategories() async {
  final response = await supabase.from('category').select();

  if (response.isEmpty) {
    return [];
  }

  return (response as List)
      .map((json) => CategoryModel.fromJson(json))
      .toList();
}

@riverpod
FutureOr<List<CategoryModel>> categories(Ref ref) async {
  return await fetchcategories();
}
