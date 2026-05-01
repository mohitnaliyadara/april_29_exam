import 'package:april_29_exam/data/model/response/coach_data_response.dart';
import 'package:april_29_exam/generated/assets.dart';
import 'package:april_29_exam/values/app_text_style.dart';
import 'package:april_29_exam/widget/custom_image_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../values/app_colors.dart';

Widget customTopCoachDataChip(Coach coach) {
  return Container(
    clipBehavior: .hardEdge,
    isAntiAlias: true,
    height: 280.h,
    width: 161.w,
    margin: EdgeInsets.symmetric(horizontal: 8.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.r),
      border: Border.all(color: AppColors.whiteColor, width: 1.5),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customImageBox(
          image: coach.imageUrl.toString(),
          height: 161.h,
          width: double.infinity,
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                coach.name ?? "Unknow",
                style: semiBoldText.copyWith(color: AppColors.whiteColor),
              ),
              SvgPicture.asset(
                Assets.images.home.badge.path,
                width: 16.w,
                height: 16.h,
              ),
            ],
          ),
        ),
        8.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Text(
            "4 Years Experience",
            style: regularText.copyWith(
              fontSize: 12.spMin,
              color: AppColors.whiteColor,
            ),
          ),
        ),
        8.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.images.home.rating.path,
                    height: 13.h,
                    width: 13.w,
                  ),
                  5.horizontalSpace,
                  Text(
                    "${coach.rating} ",
                    style: semiBoldText.copyWith(
                      fontSize: 12.spMin,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  Text(
                    "(${coach.reviewsCount})",
                    style: semiBoldText.copyWith(
                      fontSize: 12.spMin,
                      color: AppColors.borderColor,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.images.home.bookMark.path,
                    height: 13.h,
                    width: 13.w,
                  ),
                  5.horizontalSpace,
                  Text(
                    coach.levelOfCoaching.toString(),
                    style: semiBoldText.copyWith(
                      fontSize: 12.spMin,
                      color: AppColors.textGreyTeraryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        5.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 2.h),
          child: Row(
            spacing: 16.w,
            children: [
              SvgPicture.asset(
                Assets.images.home.badminton.path,
                height: 20.h,
                width: 20.w,
              ),

              SvgPicture.asset(
                Assets.images.home.tt.path,
                height: 20.h,
                width: 20.w,
              ),
              SvgPicture.asset(
                Assets.images.home.cricket.path,
                height: 20.h,
                width: 20.w,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget customOtherCoachDataChip(Coach coach) {
  return Container(
    clipBehavior: .hardEdge,
    margin: EdgeInsets.symmetric(vertical: 8.h),
    isAntiAlias: true,
    height: 140.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.r),
      border: Border.all(color: AppColors.whiteColor, width: 1.5),
    ),
    child: Row(
      children: [
        Padding(
          padding: EdgeInsets.all(8.r),
          child: customImageBox(
            image: coach.imageUrl.toString(),

            width: 120.w,
            height: 120.h,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        coach.name ?? "Unknow",
                        style: regularText.copyWith(
                          color: AppColors.whiteColor,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    6.horizontalSpace,
                    SvgPicture.asset(Assets.images.home.badge.path),
                    10.horizontalSpace,
                    Text(
                      coach.rating.toString(),
                      style: semiBoldText.copyWith(
                        color: AppColors.whiteColor,
                        fontSize: 14.spMin,
                      ),
                    ),
                    4.horizontalSpace,
                    SvgPicture.asset(Assets.images.home.rating.path),
                    4.horizontalSpace,
                    Text(
                      "(${coach.reviewsCount})",
                      style: semiBoldText.copyWith(
                        color: AppColors.textGreyTeraryColor,
                        fontSize: 14.spMin,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0.h),
                  child: Row(
                    children: [
                      SvgPicture.asset(Assets.images.home.bookMark.path),
                      4.horizontalSpace,
                      Text(
                        coach.levelOfCoaching.toString(),
                        style: regularText.copyWith(
                          color: AppColors.textGreyTeraryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      Assets.images.home.distance.path,
                      height: 18.h,
                      width: 16.w,
                    ),
                    8.horizontalSpace,
                    Text(
                      "${coach.distanceKm} kms(Away from you)".toString(),
                      style: regularText.copyWith(
                        color: AppColors.textGreyTeraryColor,
                        fontSize: 12.spMin,
                      ),
                    ),
                  ],
                ),
                5.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 2.h,
                  ),
                  child: Row(
                    spacing: 16.w,
                    children: [
                      SvgPicture.asset(
                        Assets.images.home.badminton.path,
                        height: 20.h,
                        width: 20.w,
                      ),

                      SvgPicture.asset(
                        Assets.images.home.tt.path,
                        height: 20.h,
                        width: 20.w,
                      ),
                      SvgPicture.asset(
                        Assets.images.home.cricket.path,
                        height: 20.h,
                        width: 20.w,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
