import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'info_state.dart';

class InfoCubit extends Cubit<InfoState> {
  InfoCubit() : super(const InfoState());

  Future<void> getDeviceInfo() async {
    emit(state.copyWith(status: InfoStatus.loading));
    try {
      const platform = MethodChannel('com.piero.app.cuy/info');
      final appName = await platform.invokeMethod('getAppName') as String;
      final packageID = await platform.invokeMethod('getPackageID') as String;
      final version = await platform.invokeMethod('getVersion') as String;
      final deviceModel =
          await platform.invokeMethod('getDeviceModel') as String;
      final deviceBrand =
          await platform.invokeMethod('getDeviceBrand') as String;
      final osVersion = await platform.invokeMethod('getOSVersion') as String;
      final batteryLevel =
          await platform.invokeMethod('getBatteryLevel') as int;
      emit(
        state.copyWith(
          status: InfoStatus.success,
          appName: appName,
          packageID: packageID,
          version: version,
          deviceModel: deviceModel,
          deviceBrand: deviceBrand,
          osVersion: osVersion,
          batteryLevel: batteryLevel,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: InfoStatus.failure));
    }
  }
}
