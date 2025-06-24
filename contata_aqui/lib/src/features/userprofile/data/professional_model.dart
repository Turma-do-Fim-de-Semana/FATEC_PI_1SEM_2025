import 'package:freezed_annotation/freezed_annotation.dart';

part 'professional_model.freezed.dart';
part 'professional_model.g.dart';

@freezed
abstract class ProfessionalModel with _$ProfessionalModel {
  factory ProfessionalModel({
    // ignore: non_constant_identifier_names
    required String id_professional,
    required String name,
    String? phone,
    required String email,
    String? description,
    String? city,
    String? image,
    // ignore: non_constant_identifier_names
    required String? category_id,
    String? schedule,
    // ignore: non_constant_identifier_names
    DateTime? created_at,
    // ignore: non_constant_identifier_names
    DateTime? updated_at,
  }) = _ProfessionalModel;

  factory ProfessionalModel.fromJson(Map<String, dynamic> json) =>
      _$ProfessionalModelFromJson(json);
}
