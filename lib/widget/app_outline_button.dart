import 'package:april_29_exam/values/app_colors.dart';
import 'package:april_29_exam/values/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppOutlineButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final Color? borderColor;

  const AppOutlineButton({
    super.key,
     this.text,
    this.height,
    this.width,
    this.textStyle,
    this.borderColor,
    required this.onPressed, this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8.r),
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: height ?? 34,
        width: width ?? 100.w,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor ?? AppColors.textGreyTeraryColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(8.r),
          color: AppColors.transparent
        ),
        child: child ?? Text(
          text ?? "",
          style:
              textStyle ??
              regularText.copyWith(
                color: AppColors.primaryColor,
                fontSize: 15.spMin,
              ),
        ),
      ),
    );
  }
}
