import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../values/app_colors.dart';
import '../../../../values/app_text_style.dart';
import '../../../../widget/custom_app_bar.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 222.h,
        bottom: Container(
          height: 131.h,
          alignment: .topCenter,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Container(
                  height: 60.h,
                  width: 4.w,
                  color: AppColors.primaryColor,
                ),
              ),
              15.horizontalSpace,
              Text(
                "Hello !",
                style: semiBoldText.copyWith(
                  fontSize: 22.spMin,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
