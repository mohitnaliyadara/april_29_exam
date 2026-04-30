import 'dart:developer';

import 'package:april_29_exam/generated/assets.dart';
import 'package:april_29_exam/ui/auth/signup/store/signup_store.dart';
import 'package:april_29_exam/values/app_colors.dart';
import 'package:april_29_exam/values/app_text_style.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppTextFiled extends StatelessWidget {
  final InputDecoration? decoration;
  final TextEditingController? controller;
  final Iterable<String>? autoFillHints;
  final bool? obscureText;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputType? keyBoardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final bool? autoFocus;
  final String prefixIcon;
  final Widget? suffixIcon;
  final bool? showCountryCode;
  const AppTextFiled({
    super.key,
    this.decoration,
    this.controller,
    this.autoFillHints,
    this.obscureText,
    this.focusNode,
    this.keyBoardType,
    this.inputFormatters,
    this.textInputAction = TextInputAction.next,
    this.nextFocusNode,
    this.autoFocus,
    required this.prefixIcon,
    this.showCountryCode = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: TextFormField(
        style: mediumText.copyWith(fontSize: 14.spMin),
        controller: controller,
        autofillHints: autoFillHints,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        obscureText: obscureText ?? false,

        focusNode: focusNode,
        keyboardType: keyBoardType,
        inputFormatters: inputFormatters,
        textInputAction: textInputAction,
        onFieldSubmitted: (_) => submit(context),
        autofocus: autoFocus ?? false,
        cursorColor: AppColors.backgroundColor,
        decoration:
            decoration ??
            InputDecoration(
              filled: true,
              fillColor: AppColors.textFiledColor.withValues(alpha: 0.5),
              suffixIcon: suffixIcon,
              prefixIcon: Padding(
                padding: EdgeInsets.fromLTRB(12.w, 16.h, 0.w, 15.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(prefixIcon, height: 24.h, width: 24.w),

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15.w),
                      width: 1.w,
                      height: 23.h,
                      color: AppColors.dividerColor,
                    ),
                    if (showCountryCode == true)
                      InkWell(
                        onTap: () => countryCode(context),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              signupStore.countryCode ?? "+91",
                              style: mediumText.copyWith(fontSize: 14.spMin),
                            ),
                            8.horizontalSpace,
                            Image.asset(Assets.images.icons.downArrow.path),
                          ],
                        ),
                      ),
                    11.horizontalSpace,
                  ],
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r),
                borderSide: BorderSide.none,
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r),
                borderSide: BorderSide(
                  color: AppColors.textFiledBorderColor,
                  width: 1.5.r,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r),
                borderSide: BorderSide(color: AppColors.errorColor),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r),
                borderSide: BorderSide(
                  color: AppColors.errorColor,
                  width: 1.5.r,
                ),
              ),
            ),
      ),
    );
  }

  void submit(BuildContext context) {
    switch (textInputAction) {
      case TextInputAction.done:
        FocusScope.of(context).unfocus();
      case TextInputAction.next:
        FocusScope.of(context).requestFocus(nextFocusNode);
      default:
        FocusScope.of(context).nextFocus();
    }
  }

  void countryCode(BuildContext context) {
    showCountryPicker(
      context: context,
      onSelect: (value) {
        log("Country code : ${value.phoneCode}");
        signupStore.setCountryCode(value.phoneCode);
      },
      favorite: ["IN", "US"],
      showPhoneCode: true,
    );
  }
}
