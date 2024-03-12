import 'package:equatable/equatable.dart';

part 'role.g.dart';

/// {@template role}
/// Modelo de datos para un rol
/// {@endtemplate}
class Role extends Equatable {
  /// {@macro role}
  const Role({
    required this.id,
    required this.name,
  });

  /// Crea una instancia de [Role] a partir de un [Map]
  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  /// Crea un [Map] a partir de una instancia de [Role]
  Map<String, dynamic> toJson() => _$RoleToJson(this);

  /// ID
  final int id;

  /// Nombre
  final String name;

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
