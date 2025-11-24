import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room_model.freezed.dart';
part 'chat_room_model.g.dart';

@freezed
class ChatRoomModel with _$ChatRoomModel {
  const ChatRoomModel._();

  const factory ChatRoomModel({
    // ignore: non_constant_identifier_names
    required String id_chat_room,
    // ignore: non_constant_identifier_names
    required String client_id,
    // ignore: non_constant_identifier_names
    required String professional_id,
    // ignore: non_constant_identifier_names
    DateTime? created_at,
    // ignore: non_constant_identifier_names
    DateTime? updated_at,
  }) = _ChatRoomModel;

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomModelFromJson(json);

  @override
  // ignore: non_constant_identifier_names
  String get client_id => throw UnimplementedError();

  @override
  // ignore: non_constant_identifier_names
  DateTime? get created_at => throw UnimplementedError();

  @override
  // ignore: non_constant_identifier_names
  String get id_chat_room => throw UnimplementedError();

  @override
  // ignore: non_constant_identifier_names
  String get professional_id => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }

  @override
  // ignore: non_constant_identifier_names
  DateTime? get updated_at => throw UnimplementedError();
}
