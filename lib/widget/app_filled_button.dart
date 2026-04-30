import 'package:april_29_exam/values/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/app_colors.dart';

class AppFilledButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  const AppFilledButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Ink(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        gradient: LinearGradient(
          colors: [AppColors.gradientColor1, AppColors.gradientColor2],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,

          height: 60.h,
          width: double.infinity,

          child: Text(text, style: mediumText),
        ),
      ),
    );
  }
}
