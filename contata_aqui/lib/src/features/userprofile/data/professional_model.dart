import 'package:freezed_annotation/freezed_annotation.dart';

part 'professional_model.freezed.dart';
part 'professional_model.g.dart';

@freezed
class ProfessionalModel with _$ProfessionalModel {
  const ProfessionalModel._();

  const factory ProfessionalModel({
    // ignore: non_constant_identifier_names
    required String id_professional,
    required String name,
    String? phone,
    required String email,
    String? description,
    String? cep,
    String? address,
    // ignore: non_constant_identifier_names
    String? city_state,
    String? latitude,
    String? longitude,
    String? image,
    // ignore: non_constant_identifier_names
    String? category_id,
    String? schedule,
    // ignore: non_constant_identifier_names
    bool? is_provider,
    // ignore: non_constant_identifier_names
    DateTime? created_at,
    // ignore: non_constant_identifier_names
    DateTime? updated_at,
  }) = _ProfessionalModel;

  factory ProfessionalModel.fromJson(Map<String, dynamic> json) =>
      _$ProfessionalModelFromJson(json);

  @override
  String? get address => throw UnimplementedError();

  @override
  // ignore: non_constant_identifier_names
  String? get category_id => throw UnimplementedError();

  @override
  String? get cep => throw UnimplementedError();

  @override
  // ignore: non_constant_identifier_names
  String? get city_state => throw UnimplementedError();

  @override
  // ignore: non_constant_identifier_names
  DateTime? get created_at => throw UnimplementedError();

  @override
  String? get description => throw UnimplementedError();

  @override
  String get email => throw UnimplementedError();

  @override
  // ignore: non_constant_identifier_names
  String get id_professional => throw UnimplementedError();

  @override
  String? get image => throw UnimplementedError();

  @override
  // ignore: non_constant_identifier_names
  bool? get is_provider => throw UnimplementedError();

  @override
  String? get latitude => throw UnimplementedError();

  @override
  String? get longitude => throw UnimplementedError();

  @override
  String get name => throw UnimplementedError();

  @override
  String? get phone => throw UnimplementedError();

  @override
  String? get schedule => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }

  @override
  // ignore: non_constant_identifier_names
  DateTime? get updated_at => throw UnimplementedError();
}
