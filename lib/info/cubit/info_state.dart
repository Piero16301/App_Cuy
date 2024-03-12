part of 'info_cubit.dart';

enum InfoStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == InfoStatus.initial;
  bool get isLoading => this == InfoStatus.loading;
  bool get isSuccess => this == InfoStatus.success;
  bool get isFailure => this == InfoStatus.failure;
}

class InfoState extends Equatable {
  const InfoState({
    this.status = InfoStatus.initial,
    this.appName = '',
    this.packageID = '',
    this.version = '',
    this.deviceModel = '',
    this.deviceBrand = '',
    this.osVersion = '',
    this.batteryLevel = 0,
  });

  final InfoStatus status;
  final String appName;
  final String packageID;
  final String version;
  final String deviceModel;
  final String deviceBrand;
  final String osVersion;
  final int batteryLevel;

  InfoState copyWith({
    InfoStatus? status,
    String? appName,
    String? packageID,
    String? version,
    String? deviceModel,
    String? deviceBrand,
    String? osVersion,
    int? batteryLevel,
  }) {
    return InfoState(
      status: status ?? this.status,
      appName: appName ?? this.appName,
      packageID: packageID ?? this.packageID,
      version: version ?? this.version,
      deviceModel: deviceModel ?? this.deviceModel,
      deviceBrand: deviceBrand ?? this.deviceBrand,
      osVersion: osVersion ?? this.osVersion,
      batteryLevel: batteryLevel ?? this.batteryLevel,
    );
  }

  @override
  List<Object?> get props => [
        status,
        appName,
        packageID,
        version,
        deviceModel,
        deviceBrand,
        osVersion,
        batteryLevel,
      ];
}
