import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tomtom/src/core/constants/colors.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.darkGreen,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.left,
        ),
        TextFormField(
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 30.sp)
      ],
    );
  }
}
