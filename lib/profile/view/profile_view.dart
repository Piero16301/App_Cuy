import 'package:app_cuy/app/app.dart';
import 'package:app_cuy/l10n/l10n.dart';
import 'package:app_cuy/profile/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_api/user_api.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select<AppBloc, User>((bloc) => bloc.state.user);
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          l10n.userAppBarTitle,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              UserAttributeItem(
                title: l10n.userItemName,
                content: user.name,
              ),
              UserAttributeItem(
                title: l10n.userItemLastNameFather,
                content: user.lastNameFather,
              ),
              UserAttributeItem(
                title: l10n.userItemLastNameMother,
                content: user.lastNameMother,
              ),
              UserAttributeItem(
                title: l10n.userItemLastName,
                content: user.lastName,
              ),
              UserAttributeItem(
                title: l10n.userItemCompleteName,
                content: user.fullName,
              ),
              UserAttributeItem(
                title: l10n.userItemEmail,
                content: user.email,
              ),
              UserAttributeItem(
                title: l10n.userItemDNI,
                content: user.dni,
              ),
              UserAttributeItem(
                title: l10n.userItemUserIdentificationType,
                content: user.userIdentificationType.toString(),
              ),
              UserAttributeItem(
                title: l10n.userItemBusinessName,
                content: user.businessName,
              ),
              UserAttributeItem(
                title: l10n.userItemAddress,
                content: user.address,
              ),
              UserAttributeItem(
                title: l10n.userItemBirthday,
                content: user.birthday,
              ),
              UserAttributeItem(
                title: l10n.userItemReferralCode,
                content: user.referralCode,
              ),
              UserAttributeItem(
                title: l10n.userItemReferralUrl,
                content: user.referralUrl,
              ),
              UserAttributeItem(
                title: l10n.userItemZohoId,
                content: user.zohoId,
              ),
              UserAttributeItem(
                title: l10n.userItemPhoto,
                content: user.photo,
              ),
              UserAttributeItem(
                title: l10n.userItemHasPhoto,
                content: user.hasPhoto.toString(),
              ),
              UserAttributeItem(
                title: l10n.userItemLoggedWithPhone,
                content: user.loggedWithPhone,
              ),
              UserAttributeItem(
                title: l10n.userItemRegion,
                content: user.region,
              ),
              UserAttributeItem(
                title: l10n.userItemIsTourist,
                content: user.isTourist.toString(),
              ),
              UserAttributeItem(
                title: l10n.userItemIsLegalRepresentant,
                content: user.isLegalRepresentantOfCompany.toString(),
              ),
              UserAttributeItem(
                title: l10n.userItemCompany,
                content: user.company.toString(),
              ),
              const SizedBox(height: 50),
              const LogOutButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class UserAttributeItem extends StatelessWidget {
  const UserAttributeItem({
    required this.title,
    required this.content,
    super.key,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 14,
                  ),
            ),
          ),
          Text(
            ':',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 14,
                ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              content.isEmpty ? l10n.userItemNoAssigned : content,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select<ProfileCubit, ProfileStatus>(
      (cubit) => cubit.state.status,
    );
    final l10n = context.l10n;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
      onPressed: status.isLoading ? null : context.read<ProfileCubit>().logout,
      child: status.isLoading
          ? const SizedBox.square(
              dimension: 30,
              child: CircularProgressIndicator(),
            )
          : Text(
              l10n.userItemLogout,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.white),
            ),
    );
  }
}
