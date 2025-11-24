// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'professional_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfessionalModel {

// ignore: non_constant_identifier_names
 String get id_professional; String get name; String? get phone; String get email; String? get description; String? get cep; String? get address;// ignore: non_constant_identifier_names
 String? get city_state; String? get latitude; String? get longitude; String? get image;// ignore: non_constant_identifier_names
 String? get category_id; String? get schedule;// ignore: non_constant_identifier_names
 bool? get is_provider;// ignore: non_constant_identifier_names
 DateTime? get created_at;// ignore: non_constant_identifier_names
 DateTime? get updated_at;
/// Create a copy of ProfessionalModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfessionalModelCopyWith<ProfessionalModel> get copyWith => _$ProfessionalModelCopyWithImpl<ProfessionalModel>(this as ProfessionalModel, _$identity);

  /// Serializes this ProfessionalModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfessionalModel&&(identical(other.id_professional, id_professional) || other.id_professional == id_professional)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.description, description) || other.description == description)&&(identical(other.cep, cep) || other.cep == cep)&&(identical(other.address, address) || other.address == address)&&(identical(other.city_state, city_state) || other.city_state == city_state)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.image, image) || other.image == image)&&(identical(other.category_id, category_id) || other.category_id == category_id)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.is_provider, is_provider) || other.is_provider == is_provider)&&(identical(other.created_at, created_at) || other.created_at == created_at)&&(identical(other.updated_at, updated_at) || other.updated_at == updated_at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id_professional,name,phone,email,description,cep,address,city_state,latitude,longitude,image,category_id,schedule,is_provider,created_at,updated_at);

@override
String toString() {
  return 'ProfessionalModel(id_professional: $id_professional, name: $name, phone: $phone, email: $email, description: $description, cep: $cep, address: $address, city_state: $city_state, latitude: $latitude, longitude: $longitude, image: $image, category_id: $category_id, schedule: $schedule, is_provider: $is_provider, created_at: $created_at, updated_at: $updated_at)';
}


}

/// @nodoc
abstract mixin class $ProfessionalModelCopyWith<$Res>  {
  factory $ProfessionalModelCopyWith(ProfessionalModel value, $Res Function(ProfessionalModel) _then) = _$ProfessionalModelCopyWithImpl;
@useResult
$Res call({
 String id_professional, String name, String? phone, String email, String? description, String? cep, String? address, String? city_state, String? latitude, String? longitude, String? image, String? category_id, String? schedule, bool? is_provider, DateTime? created_at, DateTime? updated_at
});




}
/// @nodoc
class _$ProfessionalModelCopyWithImpl<$Res>
    implements $ProfessionalModelCopyWith<$Res> {
  _$ProfessionalModelCopyWithImpl(this._self, this._then);

  final ProfessionalModel _self;
  final $Res Function(ProfessionalModel) _then;

/// Create a copy of ProfessionalModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id_professional = null,Object? name = null,Object? phone = freezed,Object? email = null,Object? description = freezed,Object? cep = freezed,Object? address = freezed,Object? city_state = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? image = freezed,Object? category_id = freezed,Object? schedule = freezed,Object? is_provider = freezed,Object? created_at = freezed,Object? updated_at = freezed,}) {
  return _then(_self.copyWith(
id_professional: null == id_professional ? _self.id_professional : id_professional // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,cep: freezed == cep ? _self.cep : cep // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,city_state: freezed == city_state ? _self.city_state : city_state // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,category_id: freezed == category_id ? _self.category_id : category_id // ignore: cast_nullable_to_non_nullable
as String?,schedule: freezed == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as String?,is_provider: freezed == is_provider ? _self.is_provider : is_provider // ignore: cast_nullable_to_non_nullable
as bool?,created_at: freezed == created_at ? _self.created_at : created_at // ignore: cast_nullable_to_non_nullable
as DateTime?,updated_at: freezed == updated_at ? _self.updated_at : updated_at // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfessionalModel].
extension ProfessionalModelPatterns on ProfessionalModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfessionalModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfessionalModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfessionalModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfessionalModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfessionalModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfessionalModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id_professional,  String name,  String? phone,  String email,  String? description,  String? cep,  String? address,  String? city_state,  String? latitude,  String? longitude,  String? image,  String? category_id,  String? schedule,  bool? is_provider,  DateTime? created_at,  DateTime? updated_at)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfessionalModel() when $default != null:
return $default(_that.id_professional,_that.name,_that.phone,_that.email,_that.description,_that.cep,_that.address,_that.city_state,_that.latitude,_that.longitude,_that.image,_that.category_id,_that.schedule,_that.is_provider,_that.created_at,_that.updated_at);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id_professional,  String name,  String? phone,  String email,  String? description,  String? cep,  String? address,  String? city_state,  String? latitude,  String? longitude,  String? image,  String? category_id,  String? schedule,  bool? is_provider,  DateTime? created_at,  DateTime? updated_at)  $default,) {final _that = this;
switch (_that) {
case _ProfessionalModel():
return $default(_that.id_professional,_that.name,_that.phone,_that.email,_that.description,_that.cep,_that.address,_that.city_state,_that.latitude,_that.longitude,_that.image,_that.category_id,_that.schedule,_that.is_provider,_that.created_at,_that.updated_at);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id_professional,  String name,  String? phone,  String email,  String? description,  String? cep,  String? address,  String? city_state,  String? latitude,  String? longitude,  String? image,  String? category_id,  String? schedule,  bool? is_provider,  DateTime? created_at,  DateTime? updated_at)?  $default,) {final _that = this;
switch (_that) {
case _ProfessionalModel() when $default != null:
return $default(_that.id_professional,_that.name,_that.phone,_that.email,_that.description,_that.cep,_that.address,_that.city_state,_that.latitude,_that.longitude,_that.image,_that.category_id,_that.schedule,_that.is_provider,_that.created_at,_that.updated_at);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfessionalModel extends ProfessionalModel {
  const _ProfessionalModel({required this.id_professional, required this.name, this.phone, required this.email, this.description, this.cep, this.address, this.city_state, this.latitude, this.longitude, this.image, this.category_id, this.schedule, this.is_provider, this.created_at, this.updated_at}): super._();
  factory _ProfessionalModel.fromJson(Map<String, dynamic> json) => _$ProfessionalModelFromJson(json);

// ignore: non_constant_identifier_names
@override final  String id_professional;
@override final  String name;
@override final  String? phone;
@override final  String email;
@override final  String? description;
@override final  String? cep;
@override final  String? address;
// ignore: non_constant_identifier_names
@override final  String? city_state;
@override final  String? latitude;
@override final  String? longitude;
@override final  String? image;
// ignore: non_constant_identifier_names
@override final  String? category_id;
@override final  String? schedule;
// ignore: non_constant_identifier_names
@override final  bool? is_provider;
// ignore: non_constant_identifier_names
@override final  DateTime? created_at;
// ignore: non_constant_identifier_names
@override final  DateTime? updated_at;

/// Create a copy of ProfessionalModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfessionalModelCopyWith<_ProfessionalModel> get copyWith => __$ProfessionalModelCopyWithImpl<_ProfessionalModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfessionalModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfessionalModel&&(identical(other.id_professional, id_professional) || other.id_professional == id_professional)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.description, description) || other.description == description)&&(identical(other.cep, cep) || other.cep == cep)&&(identical(other.address, address) || other.address == address)&&(identical(other.city_state, city_state) || other.city_state == city_state)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.image, image) || other.image == image)&&(identical(other.category_id, category_id) || other.category_id == category_id)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.is_provider, is_provider) || other.is_provider == is_provider)&&(identical(other.created_at, created_at) || other.created_at == created_at)&&(identical(other.updated_at, updated_at) || other.updated_at == updated_at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id_professional,name,phone,email,description,cep,address,city_state,latitude,longitude,image,category_id,schedule,is_provider,created_at,updated_at);

@override
String toString() {
  return 'ProfessionalModel(id_professional: $id_professional, name: $name, phone: $phone, email: $email, description: $description, cep: $cep, address: $address, city_state: $city_state, latitude: $latitude, longitude: $longitude, image: $image, category_id: $category_id, schedule: $schedule, is_provider: $is_provider, created_at: $created_at, updated_at: $updated_at)';
}


}

/// @nodoc
abstract mixin class _$ProfessionalModelCopyWith<$Res> implements $ProfessionalModelCopyWith<$Res> {
  factory _$ProfessionalModelCopyWith(_ProfessionalModel value, $Res Function(_ProfessionalModel) _then) = __$ProfessionalModelCopyWithImpl;
@override @useResult
$Res call({
 String id_professional, String name, String? phone, String email, String? description, String? cep, String? address, String? city_state, String? latitude, String? longitude, String? image, String? category_id, String? schedule, bool? is_provider, DateTime? created_at, DateTime? updated_at
});




}
/// @nodoc
class __$ProfessionalModelCopyWithImpl<$Res>
    implements _$ProfessionalModelCopyWith<$Res> {
  __$ProfessionalModelCopyWithImpl(this._self, this._then);

  final _ProfessionalModel _self;
  final $Res Function(_ProfessionalModel) _then;

/// Create a copy of ProfessionalModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id_professional = null,Object? name = null,Object? phone = freezed,Object? email = null,Object? description = freezed,Object? cep = freezed,Object? address = freezed,Object? city_state = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? image = freezed,Object? category_id = freezed,Object? schedule = freezed,Object? is_provider = freezed,Object? created_at = freezed,Object? updated_at = freezed,}) {
  return _then(_ProfessionalModel(
id_professional: null == id_professional ? _self.id_professional : id_professional // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,cep: freezed == cep ? _self.cep : cep // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,city_state: freezed == city_state ? _self.city_state : city_state // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,category_id: freezed == category_id ? _self.category_id : category_id // ignore: cast_nullable_to_non_nullable
as String?,schedule: freezed == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as String?,is_provider: freezed == is_provider ? _self.is_provider : is_provider // ignore: cast_nullable_to_non_nullable
as bool?,created_at: freezed == created_at ? _self.created_at : created_at // ignore: cast_nullable_to_non_nullable
as DateTime?,updated_at: freezed == updated_at ? _self.updated_at : updated_at // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
