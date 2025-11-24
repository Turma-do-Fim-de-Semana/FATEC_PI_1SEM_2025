// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatRoomModel {

// ignore: non_constant_identifier_names
 String get id_chat_room;// ignore: non_constant_identifier_names
 String get client_id;// ignore: non_constant_identifier_names
 String get professional_id;// ignore: non_constant_identifier_names
 DateTime? get created_at;// ignore: non_constant_identifier_names
 DateTime? get updated_at;
/// Create a copy of ChatRoomModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatRoomModelCopyWith<ChatRoomModel> get copyWith => _$ChatRoomModelCopyWithImpl<ChatRoomModel>(this as ChatRoomModel, _$identity);

  /// Serializes this ChatRoomModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatRoomModel&&(identical(other.id_chat_room, id_chat_room) || other.id_chat_room == id_chat_room)&&(identical(other.client_id, client_id) || other.client_id == client_id)&&(identical(other.professional_id, professional_id) || other.professional_id == professional_id)&&(identical(other.created_at, created_at) || other.created_at == created_at)&&(identical(other.updated_at, updated_at) || other.updated_at == updated_at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id_chat_room,client_id,professional_id,created_at,updated_at);

@override
String toString() {
  return 'ChatRoomModel(id_chat_room: $id_chat_room, client_id: $client_id, professional_id: $professional_id, created_at: $created_at, updated_at: $updated_at)';
}


}

/// @nodoc
abstract mixin class $ChatRoomModelCopyWith<$Res>  {
  factory $ChatRoomModelCopyWith(ChatRoomModel value, $Res Function(ChatRoomModel) _then) = _$ChatRoomModelCopyWithImpl;
@useResult
$Res call({
 String id_chat_room, String client_id, String professional_id, DateTime? created_at, DateTime? updated_at
});




}
/// @nodoc
class _$ChatRoomModelCopyWithImpl<$Res>
    implements $ChatRoomModelCopyWith<$Res> {
  _$ChatRoomModelCopyWithImpl(this._self, this._then);

  final ChatRoomModel _self;
  final $Res Function(ChatRoomModel) _then;

/// Create a copy of ChatRoomModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id_chat_room = null,Object? client_id = null,Object? professional_id = null,Object? created_at = freezed,Object? updated_at = freezed,}) {
  return _then(_self.copyWith(
id_chat_room: null == id_chat_room ? _self.id_chat_room : id_chat_room // ignore: cast_nullable_to_non_nullable
as String,client_id: null == client_id ? _self.client_id : client_id // ignore: cast_nullable_to_non_nullable
as String,professional_id: null == professional_id ? _self.professional_id : professional_id // ignore: cast_nullable_to_non_nullable
as String,created_at: freezed == created_at ? _self.created_at : created_at // ignore: cast_nullable_to_non_nullable
as DateTime?,updated_at: freezed == updated_at ? _self.updated_at : updated_at // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatRoomModel].
extension ChatRoomModelPatterns on ChatRoomModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatRoomModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatRoomModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatRoomModel value)  $default,){
final _that = this;
switch (_that) {
case _ChatRoomModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatRoomModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChatRoomModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id_chat_room,  String client_id,  String professional_id,  DateTime? created_at,  DateTime? updated_at)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatRoomModel() when $default != null:
return $default(_that.id_chat_room,_that.client_id,_that.professional_id,_that.created_at,_that.updated_at);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id_chat_room,  String client_id,  String professional_id,  DateTime? created_at,  DateTime? updated_at)  $default,) {final _that = this;
switch (_that) {
case _ChatRoomModel():
return $default(_that.id_chat_room,_that.client_id,_that.professional_id,_that.created_at,_that.updated_at);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id_chat_room,  String client_id,  String professional_id,  DateTime? created_at,  DateTime? updated_at)?  $default,) {final _that = this;
switch (_that) {
case _ChatRoomModel() when $default != null:
return $default(_that.id_chat_room,_that.client_id,_that.professional_id,_that.created_at,_that.updated_at);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatRoomModel extends ChatRoomModel {
  const _ChatRoomModel({required this.id_chat_room, required this.client_id, required this.professional_id, this.created_at, this.updated_at}): super._();
  factory _ChatRoomModel.fromJson(Map<String, dynamic> json) => _$ChatRoomModelFromJson(json);

// ignore: non_constant_identifier_names
@override final  String id_chat_room;
// ignore: non_constant_identifier_names
@override final  String client_id;
// ignore: non_constant_identifier_names
@override final  String professional_id;
// ignore: non_constant_identifier_names
@override final  DateTime? created_at;
// ignore: non_constant_identifier_names
@override final  DateTime? updated_at;

/// Create a copy of ChatRoomModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatRoomModelCopyWith<_ChatRoomModel> get copyWith => __$ChatRoomModelCopyWithImpl<_ChatRoomModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatRoomModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatRoomModel&&(identical(other.id_chat_room, id_chat_room) || other.id_chat_room == id_chat_room)&&(identical(other.client_id, client_id) || other.client_id == client_id)&&(identical(other.professional_id, professional_id) || other.professional_id == professional_id)&&(identical(other.created_at, created_at) || other.created_at == created_at)&&(identical(other.updated_at, updated_at) || other.updated_at == updated_at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id_chat_room,client_id,professional_id,created_at,updated_at);

@override
String toString() {
  return 'ChatRoomModel(id_chat_room: $id_chat_room, client_id: $client_id, professional_id: $professional_id, created_at: $created_at, updated_at: $updated_at)';
}


}

/// @nodoc
abstract mixin class _$ChatRoomModelCopyWith<$Res> implements $ChatRoomModelCopyWith<$Res> {
  factory _$ChatRoomModelCopyWith(_ChatRoomModel value, $Res Function(_ChatRoomModel) _then) = __$ChatRoomModelCopyWithImpl;
@override @useResult
$Res call({
 String id_chat_room, String client_id, String professional_id, DateTime? created_at, DateTime? updated_at
});




}
/// @nodoc
class __$ChatRoomModelCopyWithImpl<$Res>
    implements _$ChatRoomModelCopyWith<$Res> {
  __$ChatRoomModelCopyWithImpl(this._self, this._then);

  final _ChatRoomModel _self;
  final $Res Function(_ChatRoomModel) _then;

/// Create a copy of ChatRoomModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id_chat_room = null,Object? client_id = null,Object? professional_id = null,Object? created_at = freezed,Object? updated_at = freezed,}) {
  return _then(_ChatRoomModel(
id_chat_room: null == id_chat_room ? _self.id_chat_room : id_chat_room // ignore: cast_nullable_to_non_nullable
as String,client_id: null == client_id ? _self.client_id : client_id // ignore: cast_nullable_to_non_nullable
as String,professional_id: null == professional_id ? _self.professional_id : professional_id // ignore: cast_nullable_to_non_nullable
as String,created_at: freezed == created_at ? _self.created_at : created_at // ignore: cast_nullable_to_non_nullable
as DateTime?,updated_at: freezed == updated_at ? _self.updated_at : updated_at // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
