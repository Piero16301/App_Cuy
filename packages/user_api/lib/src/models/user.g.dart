// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int? ?? 0,
    name: json['name'] as String? ?? '',
    lastNameFather: json['lastNameFather'] as String? ?? '',
    lastNameMother: json['lastNameMother'] as String? ?? '',
    lastName: json['lastName'] as String? ?? '',
    fullName: json['fullName'] as String? ?? '',
    email: json['email'] as String? ?? '',
    dni: json['dni'] as String? ?? '',
    userIdentificationType: json['userIdentificationType'] as int? ?? 0,
    businessName: json['businessName'] as String? ?? '',
    address: json['address'] as String? ?? '',
    birthday: json['birthday'] as String? ?? '',
    referralCode: json['referralCode'] as String? ?? '',
    referralUrl: json['referralUrl'] as String? ?? '',
    zohoId: json['zohoId'] as String? ?? '',
    photo: json['photo'] as String? ?? '',
    hasPhoto: json['hasPhoto'] as bool? ?? false,
    loggedWithPhone: json['loggedWithPhone'] as String? ?? '',
    region: json['region'] as String? ?? '',
    isTourist: json['isTourist'] as bool? ?? false,
    isLegalRepresentantOfCompany:
        json['isLegalRepresentantOfCompany'] as bool? ?? false,
    company: json['company'] == null
        ? Company.empty
        : Company.fromJson(json['company'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lastNameFather': instance.lastNameFather,
      'lastNameMother': instance.lastNameMother,
      'lastName': instance.lastName,
      'fullName': instance.fullName,
      'email': instance.email,
      'dni': instance.dni,
      'userIdentificationType': instance.userIdentificationType,
      'businessName': instance.businessName,
      'address': instance.address,
      'birthday': instance.birthday,
      'referralCode': instance.referralCode,
      'referralUrl': instance.referralUrl,
      'zohoId': instance.zohoId,
      'photo': instance.photo,
      'hasPhoto': instance.hasPhoto,
      'loggedWithPhone': instance.loggedWithPhone,
      'region': instance.region,
      'isTourist': instance.isTourist,
      'isLegalRepresentantOfCompany': instance.isLegalRepresentantOfCompany,
      'company': instance.company,
    };
