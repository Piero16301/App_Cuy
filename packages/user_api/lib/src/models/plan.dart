import 'package:equatable/equatable.dart';
import 'package:user_api/src/models/models.dart';

part 'plan.g.dart';

/// {@template plan}
/// Modelo de datos para un plan
/// {@endtemplate}
class Plan extends Equatable {
  /// {@macro plan}
  const Plan({
    required this.id,
    required this.bundleId,
    required this.name,
    required this.description,
    required this.quantity,
    required this.quantityReal,
    required this.price,
    required this.duration,
    required this.isSelected,
    required this.isUnlimited,
    required this.pricePlanID,
    required this.isPopular,
    required this.isRecommended,
    required this.repurchase,
    required this.isRollover,
    required this.name2,
    required this.name3,
    required this.hasFreeApps,
    required this.hasFacebookFull,
    required this.hasInstagramFull,
    required this.hasFacebookPhoto,
    required this.hasInstagramPhoto,
    required this.facebookFullDesc,
    required this.groupName,
    required this.nameByte,
    required this.nameSecond,
    required this.nameSms,
    required this.isUnlimitedByte,
    required this.isUnlimitedSecond,
    required this.isUnlimitedSms,
    required this.quantityByte,
    required this.quantitySecond,
    required this.quantitySms,
    required this.bundleIds,
    required this.mediumSpeed,
    required this.mediumSpeedDescription,
    required this.bundleType,
    required this.whiteBrand,
    required this.freeApps,
    required this.migrations,
  });

  /// Crea una instancia de [Plan] a partir de un [Map]
  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);

  /// Crea un [Map] a partir de una instancia de [Plan]
  Map<String, dynamic> toJson() => _$PlanToJson(this);

  /// ID
  final int id;

  /// ID paquete
  final String bundleId;

  /// Nombre
  final String name;

  /// Descripción
  final String description;

  /// Cantidad
  final double quantity;

  /// Cantidad real
  final int quantityReal;

  /// Precio
  final double price;

  /// Duración
  final int duration;

  /// Es seleccionado
  final bool isSelected;

  /// Es ilimitado
  final bool isUnlimited;

  /// ID de precio plan
  final String pricePlanID;

  /// Es popular
  final bool isPopular;

  /// Es recomendado
  final bool isRecommended;

  /// Recomprar
  final bool repurchase;

  /// Es rollover
  final bool isRollover;

  /// Nombre 2
  final String name2;

  /// Nombre 3
  final String name3;

  /// Tiene aplicaciones gratis
  final bool hasFreeApps;

  /// Tiene Facebook full
  final bool hasFacebookFull;

  /// Tiene Instagram full
  final bool hasInstagramFull;

  /// Tiene foto Facebook
  final bool hasFacebookPhoto;

  /// Tiene foto Instagram
  final bool hasInstagramPhoto;

  /// Descripción Facebook
  final String facebookFullDesc;

  /// Nombre grupo
  final String groupName;

  /// Nombre byte
  final String nameByte;

  /// Nombre segundo
  final String nameSecond;

  /// Nombre SMS
  final String nameSms;

  /// Byte ilimitado
  final bool isUnlimitedByte;

  /// Segundo ilimitado
  final bool isUnlimitedSecond;

  /// SMS ilimitado
  final bool isUnlimitedSms;

  /// Cantidad byte
  final int quantityByte;

  /// Cantidad segundo
  final int quantitySecond;

  /// Cantidad SMS
  final int quantitySms;

  /// IDs paquetes
  final String bundleIds;

  /// Velocidad media
  final String mediumSpeed;

  /// Descripción velocidad media
  final String mediumSpeedDescription;

  /// Tipo de paquete
  final BundleType bundleType;

  /// Brand blanco
  final int whiteBrand;

  /// Aplicaciones gratis
  final List<String> freeApps;

  /// Migraciones
  final List<String> migrations;

  @override
  List<Object> get props => [
        id,
        bundleId,
        name,
        description,
        quantity,
        quantityReal,
        price,
        duration,
        isSelected,
        isUnlimited,
        pricePlanID,
        isPopular,
        isRecommended,
        repurchase,
        isRollover,
        name2,
        name3,
        hasFreeApps,
        hasFacebookFull,
        hasInstagramFull,
        hasFacebookPhoto,
        hasInstagramPhoto,
        facebookFullDesc,
        groupName,
        nameByte,
        nameSecond,
        nameSms,
        isUnlimitedByte,
        isUnlimitedSecond,
        isUnlimitedSms,
        quantityByte,
        quantitySecond,
        quantitySms,
        bundleIds,
        mediumSpeed,
        mediumSpeedDescription,
        bundleType,
        whiteBrand,
        freeApps,
        migrations,
      ];
}
