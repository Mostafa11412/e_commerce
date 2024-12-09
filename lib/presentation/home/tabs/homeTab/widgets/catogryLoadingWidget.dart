import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CatogryloadingWidget extends StatelessWidget {
  const CatogryloadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 50.r,
        ),
        SizedBox(
          height: 8.h,
        )
      ],
    );
  }
}
