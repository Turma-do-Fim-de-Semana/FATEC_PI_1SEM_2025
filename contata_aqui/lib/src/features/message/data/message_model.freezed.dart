// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageModel {

// ignore: non_constant_identifier_names
 String get id_message;// ignore: non_constant_identifier_names
 String get chatroom_id;// ignore: non_constant_identifier_names
 String get sender_type;// ignore: non_constant_identifier_names
 String get sender_id; String? get content;// ignore: non_constant_identifier_names
 DateTime? get sent_at;// ignore: non_constant_identifier_names
 DateTime? get read_at;
/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageModelCopyWith<MessageModel> get copyWith => _$MessageModelCopyWithImpl<MessageModel>(this as MessageModel, _$identity);

  /// Serializes this MessageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageModel&&(identical(other.id_message, id_message) || other.id_message == id_message)&&(identical(other.chatroom_id, chatroom_id) || other.chatroom_id == chatroom_id)&&(identical(other.sender_type, sender_type) || other.sender_type == sender_type)&&(identical(other.sender_id, sender_id) || other.sender_id == sender_id)&&(identical(other.content, content) || other.content == content)&&(identical(other.sent_at, sent_at) || other.sent_at == sent_at)&&(identical(other.read_at, read_at) || other.read_at == read_at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id_message,chatroom_id,sender_type,sender_id,content,sent_at,read_at);

@override
String toString() {
  return 'MessageModel(id_message: $id_message, chatroom_id: $chatroom_id, sender_type: $sender_type, sender_id: $sender_id, content: $content, sent_at: $sent_at, read_at: $read_at)';
}


}

/// @nodoc
abstract mixin class $MessageModelCopyWith<$Res>  {
  factory $MessageModelCopyWith(MessageModel value, $Res Function(MessageModel) _then) = _$MessageModelCopyWithImpl;
@useResult
$Res call({
 String id_message, String chatroom_id, String sender_type, String sender_id, String? content, DateTime? sent_at, DateTime? read_at
});




}
/// @nodoc
class _$MessageModelCopyWithImpl<$Res>
    implements $MessageModelCopyWith<$Res> {
  _$MessageModelCopyWithImpl(this._self, this._then);

  final MessageModel _self;
  final $Res Function(MessageModel) _then;

/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id_message = null,Object? chatroom_id = null,Object? sender_type = null,Object? sender_id = null,Object? content = freezed,Object? sent_at = freezed,Object? read_at = freezed,}) {
  return _then(_self.copyWith(
id_message: null == id_message ? _self.id_message : id_message // ignore: cast_nullable_to_non_nullable
as String,chatroom_id: null == chatroom_id ? _self.chatroom_id : chatroom_id // ignore: cast_nullable_to_non_nullable
as String,sender_type: null == sender_type ? _self.sender_type : sender_type // ignore: cast_nullable_to_non_nullable
as String,sender_id: null == sender_id ? _self.sender_id : sender_id // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,sent_at: freezed == sent_at ? _self.sent_at : sent_at // ignore: cast_nullable_to_non_nullable
as DateTime?,read_at: freezed == read_at ? _self.read_at : read_at // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [MessageModel].
extension MessageModelPatterns on MessageModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageModel value)  $default,){
final _that = this;
switch (_that) {
case _MessageModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageModel value)?  $default,){
final _that = this;
switch (_that) {
case _MessageModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id_message,  String chatroom_id,  String sender_type,  String sender_id,  String? content,  DateTime? sent_at,  DateTime? read_at)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageModel() when $default != null:
return $default(_that.id_message,_that.chatroom_id,_that.sender_type,_that.sender_id,_that.content,_that.sent_at,_that.read_at);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id_message,  String chatroom_id,  String sender_type,  String sender_id,  String? content,  DateTime? sent_at,  DateTime? read_at)  $default,) {final _that = this;
switch (_that) {
case _MessageModel():
return $default(_that.id_message,_that.chatroom_id,_that.sender_type,_that.sender_id,_that.content,_that.sent_at,_that.read_at);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id_message,  String chatroom_id,  String sender_type,  String sender_id,  String? content,  DateTime? sent_at,  DateTime? read_at)?  $default,) {final _that = this;
switch (_that) {
case _MessageModel() when $default != null:
return $default(_that.id_message,_that.chatroom_id,_that.sender_type,_that.sender_id,_that.content,_that.sent_at,_that.read_at);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessageModel extends MessageModel {
  const _MessageModel({required this.id_message, required this.chatroom_id, required this.sender_type, required this.sender_id, this.content, this.sent_at, this.read_at}): super._();
  factory _MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);

// ignore: non_constant_identifier_names
@override final  String id_message;
// ignore: non_constant_identifier_names
@override final  String chatroom_id;
// ignore: non_constant_identifier_names
@override final  String sender_type;
// ignore: non_constant_identifier_names
@override final  String sender_id;
@override final  String? content;
// ignore: non_constant_identifier_names
@override final  DateTime? sent_at;
// ignore: non_constant_identifier_names
@override final  DateTime? read_at;

/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageModelCopyWith<_MessageModel> get copyWith => __$MessageModelCopyWithImpl<_MessageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageModel&&(identical(other.id_message, id_message) || other.id_message == id_message)&&(identical(other.chatroom_id, chatroom_id) || other.chatroom_id == chatroom_id)&&(identical(other.sender_type, sender_type) || other.sender_type == sender_type)&&(identical(other.sender_id, sender_id) || other.sender_id == sender_id)&&(identical(other.content, content) || other.content == content)&&(identical(other.sent_at, sent_at) || other.sent_at == sent_at)&&(identical(other.read_at, read_at) || other.read_at == read_at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id_message,chatroom_id,sender_type,sender_id,content,sent_at,read_at);

@override
String toString() {
  return 'MessageModel(id_message: $id_message, chatroom_id: $chatroom_id, sender_type: $sender_type, sender_id: $sender_id, content: $content, sent_at: $sent_at, read_at: $read_at)';
}


}

/// @nodoc
abstract mixin class _$MessageModelCopyWith<$Res> implements $MessageModelCopyWith<$Res> {
  factory _$MessageModelCopyWith(_MessageModel value, $Res Function(_MessageModel) _then) = __$MessageModelCopyWithImpl;
@override @useResult
$Res call({
 String id_message, String chatroom_id, String sender_type, String sender_id, String? content, DateTime? sent_at, DateTime? read_at
});




}
/// @nodoc
class __$MessageModelCopyWithImpl<$Res>
    implements _$MessageModelCopyWith<$Res> {
  __$MessageModelCopyWithImpl(this._self, this._then);

  final _MessageModel _self;
  final $Res Function(_MessageModel) _then;

/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id_message = null,Object? chatroom_id = null,Object? sender_type = null,Object? sender_id = null,Object? content = freezed,Object? sent_at = freezed,Object? read_at = freezed,}) {
  return _then(_MessageModel(
id_message: null == id_message ? _self.id_message : id_message // ignore: cast_nullable_to_non_nullable
as String,chatroom_id: null == chatroom_id ? _self.chatroom_id : chatroom_id // ignore: cast_nullable_to_non_nullable
as String,sender_type: null == sender_type ? _self.sender_type : sender_type // ignore: cast_nullable_to_non_nullable
as String,sender_id: null == sender_id ? _self.sender_id : sender_id // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,sent_at: freezed == sent_at ? _self.sent_at : sent_at // ignore: cast_nullable_to_non_nullable
as DateTime?,read_at: freezed == read_at ? _self.read_at : read_at // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
