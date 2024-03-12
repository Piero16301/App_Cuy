// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Plan _$PlanFromJson(Map<String, dynamic> json) {
  return Plan(
    id: json['id'] as int? ?? 0,
    bundleId: json['bundleId'] as String? ?? '',
    name: json['name'] as String? ?? '',
    description: json['description'] as String? ?? '',
    quantity: (json['quantity'] as num?)?.toDouble() ?? 0.0,
    quantityReal: json['quantityReal'] as int? ?? 0,
    price: (json['price'] as num?)?.toDouble() ?? 0.0,
    duration: json['duration'] as int? ?? 0,
    isSelected: json['isSelected'] as bool? ?? false,
    isUnlimited: json['isUnlimited'] as bool? ?? false,
    pricePlanID: json['pricePlanID'] as String? ?? '',
    isPopular: json['isPopular'] as bool? ?? false,
    isRecommended: json['isRecommended'] as bool? ?? false,
    repurchase: json['repurchase'] as bool? ?? false,
    isRollover: json['isRollover'] as bool? ?? false,
    name2: json['name2'] as String? ?? '',
    name3: json['name3'] as String? ?? '',
    hasFreeApps: json['hasFreeApps'] as bool? ?? false,
    hasFacebookFull: json['hasFacebookFull'] as bool? ?? false,
    hasInstagramFull: json['hasInstagramFull'] as bool? ?? false,
    hasFacebookPhoto: json['hasFacebookPhoto'] as bool? ?? false,
    hasInstagramPhoto: json['hasInstagramPhoto'] as bool? ?? false,
    facebookFullDesc: json['facebookFullDesc'] as String? ?? '',
    groupName: json['groupName'] as String? ?? '',
    nameByte: json['nameByte'] as String? ?? '',
    nameSecond: json['nameSecond'] as String? ?? '',
    nameSms: json['nameSms'] as String? ?? '',
    isUnlimitedByte: json['isUnlimitedByte'] as bool? ?? false,
    isUnlimitedSecond: json['isUnlimitedSecond'] as bool? ?? false,
    isUnlimitedSms: json['isUnlimitedSms'] as bool? ?? false,
    quantityByte: json['quantityByte'] as int? ?? 0,
    quantitySecond: json['quantitySecond'] as int? ?? 0,
    quantitySms: json['quantitySms'] as int? ?? 0,
    bundleIds: json['bundleIds'] as String? ?? '',
    mediumSpeed: json['mediumSpeed'] as String? ?? '',
    mediumSpeedDescription: json['mediumSpeedDescription'] as String? ?? '',
    bundleType: json['bundleType'] == null
        ? const BundleType(id: 0, name: '')
        : BundleType.fromJson(json['bundleType'] as Map<String, dynamic>),
    whiteBrand: json['whiteBrand'] as int? ?? 0,
    freeApps: (json['freeApps'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    migrations: (json['migrations'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$PlanToJson(Plan instance) => <String, dynamic>{
      'id': instance.id,
      'bundleId': instance.bundleId,
      'name': instance.name,
      'description': instance.description,
      'quantity': instance.quantity,
      'quantityReal': instance.quantityReal,
      'price': instance.price,
      'duration': instance.duration,
      'isSelected': instance.isSelected,
      'isUnlimited': instance.isUnlimited,
      'pricePlanID': instance.pricePlanID,
      'isPopular': instance.isPopular,
      'isRecommended': instance.isRecommended,
      'repurchase': instance.repurchase,
      'isRollover': instance.isRollover,
      'name2': instance.name2,
      'name3': instance.name3,
      'hasFreeApps': instance.hasFreeApps,
      'hasFacebookFull': instance.hasFacebookFull,
      'hasInstagramFull': instance.hasInstagramFull,
      'hasFacebookPhoto': instance.hasFacebookPhoto,
      'hasInstagramPhoto': instance.hasInstagramPhoto,
      'facebookFullDesc': instance.facebookFullDesc,
      'groupName': instance.groupName,
      'nameByte': instance.nameByte,
      'nameSecond': instance.nameSecond,
      'nameSms': instance.nameSms,
      'isUnlimitedByte': instance.isUnlimitedByte,
      'isUnlimitedSecond': instance.isUnlimitedSecond,
      'isUnlimitedSms': instance.isUnlimitedSms,
      'quantityByte': instance.quantityByte,
      'quantitySecond': instance.quantitySecond,
      'quantitySms': instance.quantitySms,
      'bundleIds': instance.bundleIds,
      'mediumSpeed': instance.mediumSpeed,
      'mediumSpeedDescription': instance.mediumSpeedDescription,
      'bundleType': instance.bundleType,
      'whiteBrand': instance.whiteBrand,
      'freeApps': instance.freeApps,
      'migrations': instance.migrations,
    };
