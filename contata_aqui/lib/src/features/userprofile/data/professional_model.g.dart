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
      cep: json['cep'] as String?,
      address: json['address'] as String?,
      city_state: json['city_state'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      image: json['image'] as String?,
      category_id: json['category_id'] as String?,
      schedule: json['schedule'] as String?,
      is_provider: json['is_provider'] as bool?,
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
      'cep': instance.cep,
      'address': instance.address,
      'city_state': instance.city_state,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'image': instance.image,
      'category_id': instance.category_id,
      'schedule': instance.schedule,
      'is_provider': instance.is_provider,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
    };
