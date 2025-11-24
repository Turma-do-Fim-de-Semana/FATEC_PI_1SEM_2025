// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatRoomModel _$ChatRoomModelFromJson(Map<String, dynamic> json) =>
    _ChatRoomModel(
      id_chat_room: json['id_chat_room'] as String,
      client_id: json['client_id'] as String,
      professional_id: json['professional_id'] as String,
      created_at:
          json['created_at'] == null
              ? null
              : DateTime.parse(json['created_at'] as String),
      updated_at:
          json['updated_at'] == null
              ? null
              : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ChatRoomModelToJson(_ChatRoomModel instance) =>
    <String, dynamic>{
      'id_chat_room': instance.id_chat_room,
      'client_id': instance.client_id,
      'professional_id': instance.professional_id,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
    };
