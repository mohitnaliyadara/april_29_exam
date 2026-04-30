import 'package:april_29_exam/values/app_colors.dart';
import 'package:april_29_exam/values/app_text_style.dart';
import 'package:april_29_exam/widget/custom_image_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../generated/assets.dart';
import '../../../../widget/custom_app_bar.dart';
import '../../../../widget/custom_icon_button.dart';

class CoachProfileScreen extends StatefulWidget {
  const CoachProfileScreen({super.key});

  @override
  State<CoachProfileScreen> createState() => _CoachProfileScreenState();
}

class _CoachProfileScreenState extends State<CoachProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          //profile card
          16.verticalSpace,
          _buildCoachProfileCard(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 90.w,
      leading: Container(
        margin: EdgeInsets.only(left: 16.w),
        child: SvgPicture.asset(Assets.images.home.rally.path),
      ),
      action: [
        CustomIconButton(
          child: SvgPicture.asset(Assets.images.home.calendar.path),
        ),
        14.horizontalSpace,
        CustomIconButton(
          child: SvgPicture.asset(Assets.images.home.message.path),
        ),
        12.horizontalSpace,
        CustomIconButton(
          child: SvgPicture.asset(Assets.images.home.notification.path),
        ),
        16.horizontalSpace,
      ],
      height: 80.h,
      bottom: SizedBox(
        child: Divider(
          color: AppColors.whiteColor.withValues(alpha: 0.2),
          height: 0.4,
          thickness: 0.4,
        ),
      ),
    );
  }

  Widget _buildCoachProfileCard() {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 125.h,
            width: 125.w,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: customImageBox(
              image:
                  "https://images.unsplash.com/photo-1552058544-f2b08422138a?w=400",
              color: AppColors.borderColor,
            ),
          ),
          15.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Perry Schaden",
                    style: semiBoldText.copyWith(color: AppColors.whiteColor),
                  ),
                  4.horizontalSpace,

                  SvgPicture.asset(Assets.images.home.badge.path),
                  32.horizontalSpace,
                  SvgPicture.asset(Assets.images.home.share.path),
                  11.horizontalSpace,
                  SvgPicture.asset(Assets.images.home.like.path),
                ],
              ),
              5.verticalSpace,
              Text(
                "Director of Sport & Head Coach",
                style: regularText.copyWith(
                  color: AppColors.whiteColor,
                  fontSize: 12.spMin,
                ),
              ),
              9.verticalSpace,
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.images.home.bookMark.path,
                    width: 20.w,
                    height: 20.h,
                  ),
                  5.horizontalSpace,
                  Text(
                    "4.5",
                    style: regularText.copyWith(
                      color: AppColors.textGreyTeraryColor,
                    ),
                  ),
                  18.horizontalSpace,
                  SvgPicture.asset(
                    Assets.images.home.rating.path,
                    width: 20.w,
                    height: 20.h,
                  ),
                  5.horizontalSpace,
                  Text(
                    "3.7",
                    style: semiBoldText.copyWith(color: AppColors.whiteColor),
                  ),
                  5.horizontalSpace,
                  Text(
                    "(12)",
                    style: semiBoldText.copyWith(color: AppColors.borderColor),
                  ),
                ],
              ),

            ],
          ),
        ],
      ),
    );
  }
}
