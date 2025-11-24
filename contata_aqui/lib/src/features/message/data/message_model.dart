import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
class MessageModel with _$MessageModel {
  const MessageModel._();

  const factory MessageModel({
    // ignore: non_constant_identifier_names
    required String id_message,
    // ignore: non_constant_identifier_names
    required String chatroom_id,
    // ignore: non_constant_identifier_names
    required String sender_type,
    // ignore: non_constant_identifier_names
    required String sender_id,
    String? content,
    // ignore: non_constant_identifier_names
    DateTime? sent_at,
    // ignore: non_constant_identifier_names
    DateTime? read_at,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  @override
  // ignore: non_constant_identifier_names
  String get chatroom_id => throw UnimplementedError();

  @override
  String? get content => throw UnimplementedError();

  @override
  // ignore: non_constant_identifier_names
  String get id_message => throw UnimplementedError();

  @override
  // ignore: non_constant_identifier_names
  DateTime? get read_at => throw UnimplementedError();

  @override
  // ignore: non_constant_identifier_names
  String get sender_id => throw UnimplementedError();

  @override
  // ignore: non_constant_identifier_names
  String get sender_type => throw UnimplementedError();

  @override
  // ignore: non_constant_identifier_names
  DateTime? get sent_at => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
