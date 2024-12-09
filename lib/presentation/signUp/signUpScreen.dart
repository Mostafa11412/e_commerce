import 'package:e_commerce/DI/di.dart';
import 'package:e_commerce/core/cache/shared_pref.dart';
import 'package:e_commerce/core/reUsableComponents/customButton.dart';
import 'package:e_commerce/core/reUsableComponents/customFormFeild.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/core/utils/app_strings.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/presentation/signUp/signUpViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController fullnameController;
  late TextEditingController mobileNumberController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    fullnameController = TextEditingController();
    mobileNumberController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    fullnameController.dispose();
    mobileNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<SignUpViewModel>(),
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
                          height: 85.h,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            height: 71.h,
                            width: 237.w,
                            AppImages.route,
                            colorFilter: const ColorFilter.mode(
                                Colors.white, BlendMode.srcIn),
                          ),
                        ),
                        SizedBox(
                          height: 47.h,
                        ),
                        CustomFormFeild(
                          controller: fullnameController,
                          title: AppStrings.fullNameTitle,
                          hint: AppStrings.fullNameHint,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (fullnameController.text.isEmpty) {
                              return AppStrings.fullNameHint;
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        CustomFormFeild(
                          controller: mobileNumberController,
                          title: AppStrings.mobileNumberTitle,
                          hint: AppStrings.mobileNumberHint,
                          maxLenght: 11,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (!Constants.mobileNumber.hasMatch(value!)) {
                              return AppStrings.mobileNumberValidator;
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 32.h,
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
                          controller: passwordController,
                          title: AppStrings.passwordTitle,
                          hint: AppStrings.passwordHint,
                          isObscured: true,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (!Constants.password.hasMatch(value!)) {
                              return AppStrings.passwordValidator;
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 56.h,
                        ),
                        BlocConsumer<SignUpViewModel, SignUpStates>(
                          listener: (context, state) {
                            if (state is SignUpSuccessState) {
                              Fluttertoast.showToast(
                                  msg: AppStrings.accountCreated,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              sharedHelper.saveToken(state.authEntity.token!);
                              print(sharedHelper.getToken());
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                AppRoutesNames.homeScreen,
                                (route) => false,
                              );
                            }
                            if (state is SignUpErrorState) {
                              Fluttertoast.showToast(
                                  msg: state.error,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          },
                          builder: (context, state) {
                            if (state is SignUpLoadingState) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              );
                            }

                            return CustomButton(
                                buttonTitle: AppStrings.signUp,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    SignUpViewModel.get(context).signUp(
                                        emailAddress: emailController.text,
                                        password: passwordController.text,
                                        mobileNumber:
                                            mobileNumberController.text,
                                        fullName: fullnameController.text);
                                  }
                                });
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRoutesNames.signIn);
                            },
                            child: Text(
                              AppStrings.alreadyHaveAccount,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontSize: 18.sp,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ))))));
  }
}
