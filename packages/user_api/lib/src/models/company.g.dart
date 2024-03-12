// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return Company(
    id: json['id'] as int? ?? 0,
    ruc: json['ruc'] as String? ?? '',
    businessName: json['businessName'] as String? ?? '',
    role: json['role'] == null
        ? const Role(id: 0, name: '')
        : Role.fromJson(json['role'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'id': instance.id,
      'ruc': instance.ruc,
      'businessName': instance.businessName,
      'role': instance.role.toJson(),
    };
