import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String buttonTitle;
  Color? buttonColor;
  TextStyle? textStyle;
  void Function() onPressed;
  CustomButton(
      {super.key,
      required this.buttonTitle,
      required this.onPressed,
      this.buttonColor,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 64.h,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor ?? Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r))),
          child: Text(
            buttonTitle,
            style: textStyle ?? Theme.of(context).textTheme.titleMedium,
          )),
    );
  }
}
