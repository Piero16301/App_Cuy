import 'package:app_cuy/app/app.dart';
import 'package:app_cuy/info/info.dart';
import 'package:app_cuy/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final locale =
        context.select<LanguageCubit, Locale>((cubit) => cubit.state.language);
    final l10n = context.l10n;

    return BlocBuilder<InfoCubit, InfoState>(
      builder: (context, state) {
        if (state.status.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.status.isFailure) {
          return Center(
            child: Text(l10n.plansDeviceInfoError),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                l10n.plansDeviceInfoTitle,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 22),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DeviceInfoItem(
                      title: l10n.plansDeviceInfoAppName,
                      content: state.appName,
                    ),
                    DeviceInfoItem(
                      title: l10n.plansDeviceInfoPackageID,
                      content: state.packageID,
                    ),
                    DeviceInfoItem(
                      title: l10n.plansDeviceInfoVersion,
                      content: state.version,
                    ),
                    DeviceInfoItem(
                      title: l10n.plansDeviceInfoDeviceModel,
                      content: state.deviceModel,
                    ),
                    DeviceInfoItem(
                      title: l10n.plansDeviceInfoDeviceBrand,
                      content: state.deviceBrand,
                    ),
                    DeviceInfoItem(
                      title: l10n.plansDeviceInfoOSVersion,
                      content: state.osVersion,
                    ),
                    DeviceInfoItem(
                      title: l10n.plansDeviceInfoBatteryLevel,
                      content: '${state.batteryLevel}%',
                    ),
                    const SizedBox(height: 50),
                    Text(
                      l10n.plansLanguageTitle,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 14),
                    ),
                    DropdownButton<String>(
                      borderRadius: BorderRadius.circular(10),
                      underline: const SizedBox(),
                      value: locale.languageCode == 'es' ? 'es' : 'en',
                      items: [
                        DropdownMenuItem(
                          value: 'en',
                          child: Row(
                            children: [
                              const Icon(Icons.language),
                              const SizedBox(width: 10),
                              Text(l10n.plansDeviceInfoEnglishItem),
                            ],
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'es',
                          child: Row(
                            children: [
                              const Icon(Icons.language),
                              const SizedBox(width: 10),
                              Text(l10n.plansDeviceInfoSpanishItem),
                            ],
                          ),
                        ),
                      ],
                      onChanged: (value) => context
                          .read<LanguageCubit>()
                          .changeLanguage(Locale(value!)),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class DeviceInfoItem extends StatelessWidget {
  const DeviceInfoItem({
    required this.title,
    required this.content,
    super.key,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 14),
          ),
        ),
        Text(
          ': ',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 14),
        ),
        Expanded(
          child: Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
