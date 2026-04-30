import 'package:april_29_exam/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final List<Widget>? action;
  final double? height;
  final Widget? bottom;
  final double? leadingWidth;
  const CustomAppBar({
    super.key,
    this.leading,
    this.action,
    this.height,
    this.bottom, this.leadingWidth,
  });

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: leading,
      leadingWidth: leadingWidth,
      actions: action,
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: bottom ?? SizedBox.fromSize(),
      ),

      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.backgroundColor,
      iconTheme: IconThemeData(color: AppColors.whiteColor),
      actionsIconTheme: IconThemeData(color: AppColors.whiteColor),
      systemOverlayStyle: SystemUiOverlayStyle.light,
    );
  }
}
