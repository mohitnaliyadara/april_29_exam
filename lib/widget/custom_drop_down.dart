import 'package:april_29_exam/ui/home/home/store/home_store.dart';
import 'package:april_29_exam/values/app_colors.dart';
import 'package:april_29_exam/values/app_text_style.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/svg.dart';
import '../generated/assets.dart';

class CustomDropDown extends StatelessWidget {
  final List<String> items;
  final Function(String?) onChanged;
  final String? icon;
  final String? selectedItem;
  const CustomDropDown({
    super.key,
    required this.items,
    required this.onChanged,
    this.icon,
    this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          customButton: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(40.r),
            ),
            child: Row(
              children: [
                SvgPicture.asset(icon ?? ""),
                5.horizontalSpace,
                Text(
                  selectedItem ?? "",
                  style: regularText.copyWith(
                    color: AppColors.textSecondaryColor,
                  ),
                ),
                10.horizontalSpace,
                SvgPicture.asset(Assets.images.home.downArrow.path),
              ],
            ),
          ),
          isExpanded: true,
          style: regularText.copyWith(color: AppColors.textSecondaryColor),
          items: items
              .map(
                (String item) => DropdownItem<String>(
                  value: item,
                  height: 40,
                  child: Text(
                    item,
                    style: regularText.copyWith(
                      color: AppColors.backgroundColor,
                    ),
                  ),
                ),
              )
              .toList(),

          onChanged: onChanged,
        ),
      ),
    );
  }
}
