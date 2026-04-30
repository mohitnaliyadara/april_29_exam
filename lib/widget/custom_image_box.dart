import 'package:april_29_exam/values/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customImageBox({
  required String image,
  double? height,
  double? width,
  BoxShape? boxShape,
  Color? color,
}) {
  return Container(
    decoration: BoxDecoration(
      shape: boxShape ?? BoxShape.rectangle,
      color: color,
    ),
    child: Image.network(
      image,
      height: height,
      width: width,
      fit: BoxFit.cover,
      isAntiAlias: true,
      errorBuilder: (context, error, stackTrace) {
        return SizedBox(
          height: height,
          width: width,
          child: Icon(
            Icons.image_not_supported_outlined,
            size: 20,
            color: color != null
                ? AppColors.backgroundColor
                : AppColors.borderColor,
          ),
        );
      },
    ),
  );
}
