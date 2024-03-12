// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bundle_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BundleType _$BundleTypeFromJson(Map<String, dynamic> json) {
  return BundleType(
    id: json['id'] == null ? 0 : json['id'] as int,
    name: json['name'] == null ? '' : json['name'] as String,
  );
}

Map<String, dynamic> _$BundleTypeToJson(BundleType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
