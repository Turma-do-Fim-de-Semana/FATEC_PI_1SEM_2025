// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'professional_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfessionalModel _$ProfessionalModelFromJson(Map<String, dynamic> json) =>
    _ProfessionalModel(
      id_professional: json['id_professional'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String?,
      email: json['email'] as String,
      description: json['description'] as String?,
      city: json['city'] as String?,
      image: json['image'] as String?,
      category_id: json['category_id'] as String?,
      schedule: json['schedule'] as String?,
      created_at:
          json['created_at'] == null
              ? null
              : DateTime.parse(json['created_at'] as String),
      updated_at:
          json['updated_at'] == null
              ? null
              : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ProfessionalModelToJson(_ProfessionalModel instance) =>
    <String, dynamic>{
      'id_professional': instance.id_professional,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'description': instance.description,
      'city': instance.city,
      'image': instance.image,
      'category_id': instance.category_id,
      'schedule': instance.schedule,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
    };
