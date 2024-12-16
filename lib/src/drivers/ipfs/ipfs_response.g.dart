// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ipfs_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IpfsResponseImpl _$$IpfsResponseImplFromJson(Map<String, dynamic> json) =>
    _$IpfsResponseImpl(
      cid: json['cid'] as String,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      meta: json['meta'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$IpfsResponseImplToJson(_$IpfsResponseImpl instance) =>
    <String, dynamic>{
      'cid': instance.cid,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'meta': instance.meta,
    };
