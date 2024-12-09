import 'package:e_commerce/DI/di.dart';
import 'package:e_commerce/core/reUsableComponents/customButton.dart';
import 'package:e_commerce/core/reUsableComponents/customFormFeild.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/core/utils/app_strings.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/presentation/payment/viewmodel/paymentViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late TextEditingController FirstNameC;

  late TextEditingController LastNameC;

  late TextEditingController EmailC;

  late TextEditingController PhoneNumberC;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    FirstNameC = TextEditingController();
    LastNameC = TextEditingController();
    EmailC = TextEditingController();
    PhoneNumberC = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    FirstNameC.dispose();
    LastNameC.dispose();
    EmailC.dispose();
    PhoneNumberC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    int amount = arguments["amount"];
    return BlocProvider<PaymentViewmodel>(
      create: (context) => getIt<PaymentViewmodel>(),
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          centerTitle: true,
          title: Text(
            AppStrings.paymentInformation,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 16, vertical: 50),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomFormFeild(
                    title: AppStrings.FirstName,
                    hint: AppStrings.enterFirstName,
                    controller: FirstNameC,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.enterFirstName;
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomFormFeild(
                    title: AppStrings.lastName,
                    hint: AppStrings.enterLastName,
                    controller: LastNameC,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.enterLastName;
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomFormFeild(
                    title: AppStrings.emailAddressTitle,
                    hint: AppStrings.emailAddressHint,
                    controller: EmailC,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (!Constants.email.hasMatch(value!)) {
                        return AppStrings.emailAddressValidator;
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomFormFeild(
                    title: AppStrings.mobileNumberTitle,
                    hint: AppStrings.mobileNumberHint,
                    controller: PhoneNumberC,
                    keyboardType: TextInputType.phone,
                    maxLenght: 11,
                    validator: (value) {
                      if (!Constants.mobileNumber.hasMatch(value!)) {
                        return AppStrings.mobileNumberValidator;
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  BlocConsumer<PaymentViewmodel, PaymentStates>(
                    listener: (context, state) {
                      if (state is PaymentKeySuccessState) {
                        Navigator.pushNamed(context, AppRoutesNames.paymob,
                            arguments: {
                              "paymentKey": state.paymentKeyEntity.token
                            });
                        PaymentViewmodel.get(context).clearCart();
                      }
                      if (state is PaymentKeyErrorState) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Text(state.error),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthTokenLoadingState ||
                          state is OrderIdLoadingState ||
                          state is PaymentKeyLoadingState) {
                        return CircularProgressIndicator(
                          color: Colors.white,
                        );
                      }
                      return CustomButton(
                          buttonTitle: AppStrings.proccess,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              PaymentViewmodel.get(context).generatePaymentKey(
                                  amount: amount * 100,
                                  email: EmailC.text,
                                  first_name: FirstNameC.text,
                                  last_name: LastNameC.text,
                                  phone_number: PhoneNumberC.text);
                            }
                          });
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
