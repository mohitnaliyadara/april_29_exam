import 'package:april_29_exam/values/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final bool? value;
  final Function(bool?)? onChanged;
  const CustomCheckBox({super.key, this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Checkbox.adaptive(
      activeColor: AppColors.primaryColor,
      value: value,
      onChanged: onChanged,
      checkColor: AppColors.backgroundColor,
    );
  }
}
