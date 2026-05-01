import 'dart:developer';

import 'package:april_29_exam/data/model/response/coach_data_response.dart';
import 'package:april_29_exam/ui/home/home/store/home_store.dart';
import 'package:april_29_exam/values/app_colors.dart';
import 'package:april_29_exam/widget/custom_app_bar.dart';
import 'package:april_29_exam/widget/custom_drop_down.dart';
import 'package:april_29_exam/widget/custom_icon_button.dart';
import 'package:april_29_exam/widget/custom_text_button.dart';
import 'package:april_29_exam/widget/search_bar_field.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../generated/assets.dart';
import '../../../../routes/app_routes.dart';
import '../../../../values/app_text_style.dart';
import '../../../../widget/custom_coach_data_chip.dart';

@RoutePage()
class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  late final TextEditingController searchController;

  late final PageController pageController;

  @override
  void initState() {
    homeStore.fetchCoaches();
    searchController = TextEditingController();
    pageController = PageController(initialPage: 0);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: _buildAppBar(),
      body: Observer(
        builder: (context) => homeStore.isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      16.verticalSpace,
                      // search bar
                      SearchBarField(controller: searchController),

                      // filter row
                      24.verticalSpace,
                      _buildFilterRow(),
                      24.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Featured Coaches",
                            style: semiBoldText.copyWith(
                              color: AppColors.whiteColor,
                            ),
                          ),
                          CustomTextButton(
                            text: "See All",
                            onPressed: () {},
                            textStyle: regularText.copyWith(
                              color: AppColors.borderColor,
                              fontSize: 12.spMin,
                            ),
                          ),
                        ],
                      ),
                      16.verticalSpace,
                      //page view
                      _buildPageView(),
                      8.verticalSpace,

                      // page indicator
                      _buildPageIndicator(),
                      24.verticalSpace,
                      // top coaches
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Top Coaches",
                            style: semiBoldText.copyWith(
                              color: AppColors.whiteColor,
                            ),
                          ),
                          CustomTextButton(
                            text: "See All",
                            onPressed: () {},
                            textStyle: regularText.copyWith(
                              color: AppColors.borderColor,
                              fontSize: 12.spMin,
                            ),
                          ),
                        ],
                      ),
                      16.verticalSpace,
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,

                          itemCount: homeStore.topCoaches?.length,
                          itemBuilder: (context, index) {
                            Coach? coach = homeStore.topCoaches?[index];
                            return InkWell(
                              onTap: () {
                                context.router.push(
                                  CoachProfileScreenRoute(id: coach.id ?? 0),
                                );
                              },
                              child: customTopCoachDataChip(coach!),
                            );
                          },
                        ),
                      ),
                      24.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Other Coaches",
                            style: semiBoldText.copyWith(
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                      16.verticalSpace,
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,

                        itemCount: homeStore.otherCoaches?.length,
                        itemBuilder: (context, index) {
                          Coach? coach = homeStore.otherCoaches?[index];
                          return InkWell(
                            onTap: () {
                              context.router.push(
                                CoachProfileScreenRoute(id: coach.id ?? 0),
                              );
                            },
                            child: customOtherCoachDataChip(coach!),
                          );
                        },
                      ),
                      30.verticalSpace,
                    ],
                  ),
                ),
              ),
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

  Widget _buildPageView() {
    return SizedBox(
      height: 220.h,
      width: 1.sw,
      child: PageView.builder(
        controller: pageController,
        onPageChanged: (value) {
          homeStore.currentPage = value;
        },
        itemCount: 3,
        itemBuilder: (context, index) => _buildCustomImage(),
      ),
    );
  }

  Widget _buildCustomImage() {
    return Stack(
      children: [
        Image.asset(Assets.images.home.firstPng.path),
        Positioned(
          top: 33.h,
          left: 30.w,
          child: Text(
            "Get tips from\nthe experts",
            style: regularText.copyWith(
              fontSize: 32.spMin,
              color: AppColors.primaryColor,
              height: 1.1,
            ),
          ),
        ),
        Positioned(
          top: 107,
          left: 30,
          child: Text(
            "Train your mind",
            style: regularText.copyWith(color: AppColors.whiteColor),
          ),
        ),

        Positioned(
          top: 150.h,
          left: 30.w,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: AppColors.primaryColor),
            ),
            child: Text(
              "Book Now",
              style: regularText.copyWith(
                fontSize: 15.spMin,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPageIndicator() {
    return Observer(
      builder: (context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8.w,
        children: List.generate(
          3,
          (index) => Container(
            height: 8.h,
            width: 8.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == homeStore.currentPage
                  ? AppColors.primaryColor
                  : AppColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildFilterRow() {
  final filter = homeStore.filters;
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,

    child: Row(
      children: [
        CustomDropDown(
          items: filter?.sports ?? [],
          onChanged: (String? value) {
            homeStore.selectedSport = value ?? homeStore.selectedSport;
          },
          icon: Assets.images.home.cricket.path,
          selectedItem: homeStore.selectedSport,
        ),

        16.horizontalSpace,
        CustomDropDown(
          items: filter?.genders ?? [],
          onChanged: (String? value) {
            homeStore.selectedGenders = value ?? homeStore.selectedGenders;
          },
          icon: Assets.images.home.gender.path,
          selectedItem: homeStore.selectedGenders,
        ),
        16.horizontalSpace,
        CustomDropDown(
          items: filter?.coachingTypes ?? [],
          onChanged: (String? value) {
            homeStore.selectedCoachingTypes =
                value ?? homeStore.selectedCoachingTypes;
          },
          icon: Assets.images.home.cricket.path,
          selectedItem: homeStore.selectedCoachingTypes,
        ),
        16.horizontalSpace,
        CustomDropDown(
          items: filter?.distances ?? [],
          onChanged: (String? value) {
            homeStore.selectedDistance =
                value ?? homeStore.selectedCoachingTypes;
          },
          icon: Assets.images.home.distance.path,
          selectedItem: homeStore.selectedDistance,
        ),
        16.horizontalSpace,
        CustomDropDown(
          items: filter?.languages ?? [],
          onChanged: (String? value) {
            homeStore.selectedLanguage = value ?? homeStore.selectedLanguage;
          },
          icon: Assets.images.home.distance.path,
          selectedItem: homeStore.selectedLanguage,
        ),
      ],
    ),
  );
}
