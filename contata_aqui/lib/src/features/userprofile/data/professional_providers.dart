import 'package:contata_aqui/core/app_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'professional_model.dart';

final professionalByIdProvider =
    FutureProvider.family<ProfessionalModel, String>((ref, id) async {
      final supabase = ref.read(supabaseClientProvider);

      final data =
          await supabase
              .from('professional')
              .select()
              .eq('id_professional', id)
              .maybeSingle();

      return ProfessionalModel.fromJson(data!);
    });
