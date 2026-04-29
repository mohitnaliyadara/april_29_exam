import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  const CustomIconButton({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 10.r,

      borderRadius: BorderRadius.circular(30.r),
      onTap: onTap,
      child: child,
    );
  }
}
