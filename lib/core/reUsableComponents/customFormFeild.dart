// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef Validator = String? Function(String?);

class CustomFormFeild extends StatelessWidget {
  String title;
  TextStyle? titleStyle;
  String hint;
  TextStyle? hintStyle;
  Icon? suffixIcon;
  TextEditingController? controller;
  TextInputType? keyboardType;
  int maxLenght;
  bool isObscured;
  Validator? validator;
  bool? enabled;

  CustomFormFeild(
      {super.key,
      required this.title,
      this.controller,
      this.keyboardType,
      this.maxLenght = 100,
      this.isObscured = false,
      required this.hint,
      this.validator,
      this.hintStyle,
      this.titleStyle,
      this.suffixIcon,
      this.enabled});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle ??
              Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 18.sp),
        ),
        SizedBox(
          height: 12.h,
        ),
        TextFormField(
          enabled: enabled ?? true,
          controller: controller,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontSize: 18.sp, color: Colors.black),
          keyboardType: keyboardType,
          maxLength: maxLenght,
          validator: validator,
          obscureText: isObscured,
          decoration: InputDecoration(
              errorStyle: TextStyle(fontSize: 15.sp, color: Colors.red),
              counterText: '',
              hintStyle: hintStyle ??
                  Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontSize: 18.sp,
                      ),
              hintText: hint,
              fillColor: Colors.white,
              filled: true,
              suffixIcon: suffixIcon,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
              errorBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r))),
        )
      ],
    );
  }
}
