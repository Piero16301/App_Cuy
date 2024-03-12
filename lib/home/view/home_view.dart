import 'package:app_cuy/app/app.dart';
import 'package:app_cuy/home/home.dart';
import 'package:app_cuy/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:user_api/user_api.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.status.isLoading) {
          return const PlansLoading();
        } else if (state.status.isFailure) {
          return const PlansFailure();
        } else {
          return const PlansSuccess();
        }
      },
    );
  }
}

class PlansLoading extends StatelessWidget {
  const PlansLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  l10n.plansLoadingText,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 10),
                const CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PlansFailure extends StatelessWidget {
  const PlansFailure({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  l10n.plansFailureText,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: context.read<HomeCubit>().getPlans,
                  child: Text(
                    l10n.plansRetryButton,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PlansSuccess extends StatelessWidget {
  const PlansSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final plansList =
        context.select<HomeCubit, List<Plan>>((cubit) => cubit.state.plans[0]);
    final plansFree =
        context.select<HomeCubit, List<Plan>>((cubit) => cubit.state.plans[1]);
    final isAuthenticated =
        context.read<AppBloc>().state.status.isAuthenticated;
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          l10n.plansAppBarTitle,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 22),
        ),
        actions: [
          IconButton(
            onPressed: () => isAuthenticated
                ? context.push('/profile')
                : context.go('/login'),
            icon: isAuthenticated
                ? const Icon(Icons.person, size: 30)
                : const Icon(Icons.login, size: 30),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.plansPlansListTitle,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.left,
              ),
              if (plansList.isNotEmpty)
                Column(
                  children:
                      plansList.map((plan) => PlanItem(plan: plan)).toList(),
                )
              else
                Center(child: Text(l10n.plansPlansListEmpty)),
              const SizedBox(height: 20),
              Text(
                l10n.plansPlansFreeTitle,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              if (plansFree.isNotEmpty)
                Column(
                  children:
                      plansFree.map((plan) => PlanItem(plan: plan)).toList(),
                )
              else
                Text(l10n.plansPlansFreeEmpty),
            ],
          ),
        ),
      ),
      floatingActionButton: isAuthenticated
          ? FloatingActionButton.extended(
              backgroundColor: Colors.blueAccent,
              icon: const Icon(Icons.perm_device_info),
              onPressed: () => context.push('/info'),
              label: Text(
                l10n.plansDeviceInfoButton,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.white),
              ),
            )
          : null,
    );
  }
}

class PlanItem extends StatelessWidget {
  const PlanItem({
    required this.plan,
    super.key,
  });

  final Plan plan;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return InkWell(
      onTap: () => showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'ID Paquete: ${plan.bundleId}',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          contentTextStyle: Theme.of(context).textTheme.bodyMedium,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${l10n.plansItemName}: ${plan.name}'),
              Text('${l10n.plansItemDescription}: ${plan.description}'),
              Text('${l10n.plansItemQuantity}: ${plan.quantity}'),
              Text('${l10n.plansItemRealQuantity}: ${plan.quantityReal}'),
              Text('${l10n.plansItemPrice}: ${plan.price}'),
              Text('${l10n.plansItemDuration}: ${plan.duration}'),
              Text('${l10n.plansItemIsSelected}: ${plan.isSelected}'),
              Text('${l10n.plansItemIsUnlimited}: ${plan.isUnlimited}'),
              Text('${l10n.plansItemPricePlanId}: ${plan.pricePlanID}'),
              Text('${l10n.plansItemIsPopular}: ${plan.isPopular}'),
              Text('${l10n.plansItemIsRecommended}: ${plan.isRecommended}'),
              Text('${l10n.plansItemRepurchase}: ${plan.repurchase}'),
              Text('${l10n.plansItemIsRollover}: ${plan.isRollover}'),
              Text('${l10n.plansItemName2}: ${plan.name2}'),
              Text('${l10n.plansItemName3}: ${plan.name3}'),
              Text('${l10n.plansItemHasFreeApps}: ${plan.hasFreeApps}'),
              Text('${l10n.plansItemHasFacebookFull}: ${plan.hasFacebookFull}'),
              Text(
                '${l10n.plansItemHasInstagramFull}: ${plan.hasInstagramFull}',
              ),
              Text(
                '${l10n.plansItemHasFacebookPhoto}: ${plan.hasFacebookPhoto}',
              ),
              Text(
                '${l10n.plansItemHasInstagramPhoto}: ${plan.hasInstagramPhoto}',
              ),
              Text(
                '${l10n.plansItemFacebookDescription}: '
                '${plan.facebookFullDesc}',
              ),
              Text('${l10n.plansItemGroupName}: ${plan.groupName}'),
              Text('${l10n.plansItemByteName}: ${plan.nameByte}'),
              Text('${l10n.plansItemNameSecond}: ${plan.nameSecond}'),
              Text('${l10n.plansItemNameSMS}: ${plan.nameSms}'),
              Text('${l10n.plansItemByteUnlimited}: ${plan.isUnlimitedByte}'),
              Text(
                '${l10n.plansItemSecondUnlimited}: ${plan.isUnlimitedSecond}',
              ),
              Text('${l10n.plansItemSMSUnlimited}: ${plan.isUnlimitedSms}'),
              Text('${l10n.plansItemByteQuantity}: ${plan.quantityByte}'),
              Text('${l10n.plansItemSecondQuantity}: ${plan.quantitySecond}'),
              Text('${l10n.plansItemSMSQuantity}: ${plan.quantitySms}'),
              Text('${l10n.plansItemBundleIds}: ${plan.bundleIds}'),
              Text('${l10n.plansItemMediumSpeed}: ${plan.mediumSpeed}'),
              Text(
                '${l10n.plansItemMediumSpeedDescription}: '
                '${plan.mediumSpeedDescription}',
              ),
              Text('${l10n.plansItemBundleType}: ${plan.bundleType}'),
              Text('${l10n.plansItemWhiteBrand}: ${plan.whiteBrand}'),
              Text('${l10n.plansItemFreeApps}: ${plan.freeApps}'),
              Text('${l10n.plansItemMigrations}: ${plan.migrations}'),
            ],
          ),
          scrollable: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    'Cerrar',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plan.name,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    plan.description,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                '\$ ${plan.price}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
