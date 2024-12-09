import 'package:e_commerce/core/cache/shared_pref.dart';
import 'package:e_commerce/core/reUsableComponents/customButton.dart';
import 'package:e_commerce/core/reUsableComponents/customFormFeild.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                AppStrings.welcome,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text(
                AppStrings.dummyEmail,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
          CustomFormFeild(
            enabled: false,
            title: AppStrings.yourfullName,
            hint: AppStrings.dummyName,
            titleStyle: Theme.of(context).textTheme.labelLarge,
            hintStyle: Theme.of(context).textTheme.labelLarge,
            suffixIcon: const Icon(Icons.edit),
          ),
          CustomFormFeild(
            enabled: false,
            title: AppStrings.yourEmail,
            hint: AppStrings.dummyEmail,
            titleStyle: Theme.of(context).textTheme.labelLarge,
            hintStyle: Theme.of(context).textTheme.labelLarge,
            suffixIcon: const Icon(Icons.edit),
          ),
          CustomFormFeild(
            enabled: false,
            title: AppStrings.yourPhone,
            hint: AppStrings.dummyPhoneNumber,
            titleStyle: Theme.of(context).textTheme.labelLarge,
            hintStyle: Theme.of(context).textTheme.labelLarge,
            suffixIcon: const Icon(Icons.edit),
          ),
          CustomButton(
            buttonTitle: AppStrings.signOut,
            buttonColor: AppColors.mainColor,
            textStyle: Theme.of(context).textTheme.bodySmall,
            onPressed: () {
              sharedHelper.deleteToken();
              Navigator.pushNamed(context, AppRoutesNames.signIn);
            },
          )
        ],
      ),
    );
  }
}
