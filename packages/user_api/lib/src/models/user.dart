import 'package:equatable/equatable.dart';
import 'package:user_api/src/models/models.dart';

part 'user.g.dart';

/// {@template user}
/// Modelo de datos para un usuario
/// {@endtemplate}
class User extends Equatable {
  /// {@macro user}
  const User({
    required this.id,
    required this.name,
    required this.lastNameFather,
    required this.lastNameMother,
    required this.lastName,
    required this.fullName,
    required this.email,
    required this.dni,
    required this.userIdentificationType,
    required this.businessName,
    required this.address,
    required this.birthday,
    required this.referralCode,
    required this.referralUrl,
    required this.zohoId,
    required this.photo,
    required this.hasPhoto,
    required this.loggedWithPhone,
    required this.region,
    required this.isTourist,
    required this.isLegalRepresentantOfCompany,
    required this.company,
  });

  /// Crea una instancia de [User] a partir de un [Map]
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Crea un [Map] a partir de una instancia de [User]
  Map<String, dynamic> toJson() => _$UserToJson(this);

  /// Usuario vacío
  static const empty = User(
    id: 0,
    name: '',
    lastNameFather: '',
    lastNameMother: '',
    lastName: '',
    fullName: '',
    email: '',
    dni: '',
    userIdentificationType: 0,
    businessName: '',
    address: '',
    birthday: '',
    referralCode: '',
    referralUrl: '',
    zohoId: '',
    photo: '',
    hasPhoto: false,
    loggedWithPhone: '',
    region: '',
    isTourist: false,
    isLegalRepresentantOfCompany: false,
    company: Company.empty,
  );

  /// Verifica si el usuario está vacío
  bool get isEmpty => this == User.empty;

  /// ID
  final int id;

  /// Nombre
  final String name;

  /// Apellido paterno
  final String lastNameFather;

  /// Apellido materno
  final String lastNameMother;

  /// Apellido
  final String lastName;

  /// Nombre completo
  final String fullName;

  /// Email
  final String email;

  /// DNI
  final String dni;

  /// Tipo de identificación de usuario
  final int userIdentificationType;

  /// Nombre corporativo
  final String businessName;

  /// Dirección
  final String address;

  /// Cumpleaños
  final String birthday;

  /// Código referido
  final String referralCode;

  /// URL referida
  final String referralUrl;

  /// ID zoho
  final String zohoId;

  /// Foto
  final String photo;

  /// Tiene foto
  final bool hasPhoto;

  /// Logeado por teléfono
  final String loggedWithPhone;

  /// Región
  final String region;

  /// Es turista
  final bool isTourist;

  /// Es representante legal
  final bool isLegalRepresentantOfCompany;

  /// Compañía
  final Company company;

  @override
  List<Object?> get props => [
        id,
        name,
        lastNameFather,
        lastNameMother,
        lastName,
        fullName,
        email,
        dni,
        userIdentificationType,
        businessName,
        address,
        birthday,
        referralCode,
        referralUrl,
        zohoId,
        photo,
        hasPhoto,
        loggedWithPhone,
        region,
        isTourist,
        isLegalRepresentantOfCompany,
        company,
      ];
}
