import 'package:equatable/equatable.dart';

part 'bundle_type.g.dart';

/// {@template bundle_type}
/// Modelo de datos para un tipo de paquete
/// {@endtemplate}
class BundleType extends Equatable {
  /// {@macro bundle_type}
  const BundleType({
    required this.id,
    required this.name,
  });

  /// Crea una instancia de [BundleType] a partir de un [Map]
  factory BundleType.fromJson(Map<String, dynamic> json) =>
      _$BundleTypeFromJson(json);

  /// Crea un [Map] a partir de una instancia de [BundleType]
  Map<String, dynamic> toJson() => _$BundleTypeToJson(this);

  /// ID
  final int id;

  /// Nombre
  final String name;

  @override
  List<Object> get props => [
        id,
        name,
      ];
}
