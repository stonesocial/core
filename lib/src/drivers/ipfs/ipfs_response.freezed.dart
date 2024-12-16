// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ipfs_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IpfsResponse _$IpfsResponseFromJson(Map<String, dynamic> json) {
  return _IpfsResponse.fromJson(json);
}

/// @nodoc
mixin _$IpfsResponse {
  String get cid => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  Map<String, dynamic>? get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IpfsResponseCopyWith<IpfsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IpfsResponseCopyWith<$Res> {
  factory $IpfsResponseCopyWith(
          IpfsResponse value, $Res Function(IpfsResponse) then) =
      _$IpfsResponseCopyWithImpl<$Res, IpfsResponse>;
  @useResult
  $Res call(
      {String cid,
      String? createdAt,
      String? updatedAt,
      Map<String, dynamic>? meta});
}

/// @nodoc
class _$IpfsResponseCopyWithImpl<$Res, $Val extends IpfsResponse>
    implements $IpfsResponseCopyWith<$Res> {
  _$IpfsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cid = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      cid: null == cid
          ? _value.cid
          : cid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IpfsResponseImplCopyWith<$Res>
    implements $IpfsResponseCopyWith<$Res> {
  factory _$$IpfsResponseImplCopyWith(
          _$IpfsResponseImpl value, $Res Function(_$IpfsResponseImpl) then) =
      __$$IpfsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String cid,
      String? createdAt,
      String? updatedAt,
      Map<String, dynamic>? meta});
}

/// @nodoc
class __$$IpfsResponseImplCopyWithImpl<$Res>
    extends _$IpfsResponseCopyWithImpl<$Res, _$IpfsResponseImpl>
    implements _$$IpfsResponseImplCopyWith<$Res> {
  __$$IpfsResponseImplCopyWithImpl(
      _$IpfsResponseImpl _value, $Res Function(_$IpfsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cid = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? meta = freezed,
  }) {
    return _then(_$IpfsResponseImpl(
      cid: null == cid
          ? _value.cid
          : cid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      meta: freezed == meta
          ? _value._meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IpfsResponseImpl extends _IpfsResponse {
  const _$IpfsResponseImpl(
      {required this.cid,
      this.createdAt,
      this.updatedAt,
      final Map<String, dynamic>? meta})
      : _meta = meta,
        super._();

  factory _$IpfsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$IpfsResponseImplFromJson(json);

  @override
  final String cid;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  final Map<String, dynamic>? _meta;
  @override
  Map<String, dynamic>? get meta {
    final value = _meta;
    if (value == null) return null;
    if (_meta is EqualUnmodifiableMapView) return _meta;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'IpfsResponse(cid: $cid, createdAt: $createdAt, updatedAt: $updatedAt, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IpfsResponseImpl &&
            (identical(other.cid, cid) || other.cid == cid) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._meta, _meta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cid, createdAt, updatedAt,
      const DeepCollectionEquality().hash(_meta));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IpfsResponseImplCopyWith<_$IpfsResponseImpl> get copyWith =>
      __$$IpfsResponseImplCopyWithImpl<_$IpfsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IpfsResponseImplToJson(
      this,
    );
  }
}

abstract class _IpfsResponse extends IpfsResponse {
  const factory _IpfsResponse(
      {required final String cid,
      final String? createdAt,
      final String? updatedAt,
      final Map<String, dynamic>? meta}) = _$IpfsResponseImpl;
  const _IpfsResponse._() : super._();

  factory _IpfsResponse.fromJson(Map<String, dynamic> json) =
      _$IpfsResponseImpl.fromJson;

  @override
  String get cid;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  Map<String, dynamic>? get meta;
  @override
  @JsonKey(ignore: true)
  _$$IpfsResponseImplCopyWith<_$IpfsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
