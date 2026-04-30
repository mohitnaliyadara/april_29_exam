import 'package:april_29_exam/values/app_colors.dart';
import 'package:april_29_exam/widget/custom_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/app_text_style.dart';

class SearchBarField extends StatelessWidget {
  final TextEditingController? controller;
  const SearchBarField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.dividerColor,
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.text,
      style: mediumText.copyWith(
        fontSize: 16.spMin,
        color: AppColors.whiteColor,
      ),
      onTapOutside: (event) => FocusScope.of(context).unfocus(),

      decoration: InputDecoration(
        filled: true,

        fillColor: AppColors.whiteColor.withValues(alpha: 0.15),
        hintText: "Search",
        hintStyle: mediumText.copyWith(
          color: AppColors.whiteColor.withValues(alpha: 0.30),
          fontSize: 18.spMin,
        ),
        contentPadding: EdgeInsets.only(
          top: 7.h,
          left: 8.w,
          right: 8.w,
          bottom: 7.h,
        ),
        prefixIcon: Icon(
          Icons.search_outlined,
          color: AppColors.whiteColor.withValues(alpha: 0.3),
          size: 25,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: CustomIconButton(
          child: Icon(
            CupertinoIcons.mic_fill,
            color: AppColors.whiteColor.withValues(alpha: 0.3),
            size: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: AppColors.whiteColor.withValues(alpha: 0.6),
            width: 1.5,
          ),
        ),

      ),
    );
  }
}
