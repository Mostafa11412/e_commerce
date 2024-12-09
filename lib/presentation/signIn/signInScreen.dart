import 'package:e_commerce/DI/di.dart';
import 'package:e_commerce/core/cache/shared_pref.dart';
import 'package:e_commerce/core/reUsableComponents/customButton.dart';
import 'package:e_commerce/core/reUsableComponents/customFormFeild.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/core/utils/app_strings.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/presentation/signIn/sigInViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignInViewModel>(),
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        body: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 91.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      height: 71.h,
                      width: 237.w,
                      AppImages.route,
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                  ),
                  SizedBox(
                    height: 87.h,
                  ),
                  Text(
                    AppStrings.welcomeBack,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(AppStrings.pleaseSignIn,
                      style: Theme.of(context).textTheme.titleSmall),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomFormFeild(
                    controller: emailController,
                    title: AppStrings.emailAddressTitle,
                    hint: AppStrings.emailAddressHint,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (!Constants.email.hasMatch(value!)) {
                        return AppStrings.emailAddressValidator;
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  CustomFormFeild(
                      title: AppStrings.passwordTitle,
                      controller: passwordController,
                      isObscured: true,
                      keyboardType: TextInputType.visiblePassword,
                      hint: AppStrings.passwordHint,
                      validator: (value) {
                        if (!Constants.password.hasMatch(value!)) {
                          return AppStrings.passwordValidator;
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 16.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      AppStrings.forgetPassword,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 18.sp),
                    ),
                  ),
                  SizedBox(
                    height: 56.h,
                  ),
                  BlocConsumer<SignInViewModel, SignInStates>(
                    listener: (context, state) {
                      if (state is SignInErrorState) {
                        Fluttertoast.showToast(
                            msg: state.error,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                      if (state is SignInSuccessState) {
                        Fluttertoast.showToast(
                            msg: AppStrings.welcomeBack,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        sharedHelper.saveToken(state.authEntity.token!);

                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoutesNames.homeScreen,
                          (route) => false,
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is SignInLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      }
                      return CustomButton(
                          buttonTitle: AppStrings.logIn,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              SignInViewModel.get(context).signIn(
                                emailAddress: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          });
                    },
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutesNames.signUp);
                      },
                      child: Text(
                        AppStrings.dontHaveAccount,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 18.sp,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
