import 'package:april_29_exam/values/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customJoinButton({
  required Widget child,
  required VoidCallback onPressed,
}) {
  return InkWell(
    onTap: onPressed,
    child: DottedBorder(
      options: RoundedRectDottedBorderOptions(
        dashPattern: [3, 4],
        strokeWidth: 0.5,

        padding: EdgeInsets.all(16),
        color: AppColors.primaryColor,
        radius: Radius.circular(50.0.r),
      ),
      child: child,
    ),
  );
}
