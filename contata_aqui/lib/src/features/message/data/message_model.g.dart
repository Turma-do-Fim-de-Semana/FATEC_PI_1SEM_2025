// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageModel _$MessageModelFromJson(Map<String, dynamic> json) =>
    _MessageModel(
      id_message: json['id_message'] as String,
      chatroom_id: json['chatroom_id'] as String,
      sender_type: json['sender_type'] as String,
      sender_id: json['sender_id'] as String,
      content: json['content'] as String?,
      sent_at:
          json['sent_at'] == null
              ? null
              : DateTime.parse(json['sent_at'] as String),
      read_at:
          json['read_at'] == null
              ? null
              : DateTime.parse(json['read_at'] as String),
    );

Map<String, dynamic> _$MessageModelToJson(_MessageModel instance) =>
    <String, dynamic>{
      'id_message': instance.id_message,
      'chatroom_id': instance.chatroom_id,
      'sender_type': instance.sender_type,
      'sender_id': instance.sender_id,
      'content': instance.content,
      'sent_at': instance.sent_at?.toIso8601String(),
      'read_at': instance.read_at?.toIso8601String(),
    };
