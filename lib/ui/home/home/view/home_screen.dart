import 'dart:developer';

import 'package:april_29_exam/data/model/response/coach_data_response.dart';
import 'package:april_29_exam/ui/home/home/store/home_store.dart';
import 'package:april_29_exam/values/app_colors.dart';
import 'package:april_29_exam/widget/custom_app_bar.dart';
import 'package:april_29_exam/widget/custom_icon_button.dart';
import 'package:april_29_exam/widget/custom_text_button.dart';
import 'package:april_29_exam/widget/search_bar_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../generated/assets.dart';
import '../../../../values/app_text_style.dart';
import '../../../../widget/custom_coach_data_chip.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TextEditingController searchController;
  late List<OverlayEntry?> _overlayEntryList;

  final List<LayerLink> _layerLinkList = List.generate(
    5,
    (index) => LayerLink(),
  );

  late final PageController pageController;

  @override
  void initState() {
    homeStore.fetchCoaches();
    searchController = TextEditingController();
    pageController = PageController(initialPage: 0);
    // TODO: implement initState
    super.initState();
  }

  void showOverlay(List<String> data, int index) {
    _overlayEntryList.add(
      OverlayEntry(
        builder: (context) => Positioned(
          height: 100.h,
          width: 120.w,
          child: CompositedTransformFollower(
            link: _layerLinkList[index],
            showWhenUnlinked: true,
            offset: Offset(4, 40),
            child: _buildCustomDropDown(data, index),
          ),
        ),
      ),
    );
  }

  void toggleOverlay(List<String> data, int index) {
    if (homeStore.isOpen) {
      _removeOverlay(index);
      homeStore.isOpen = false;
    } else {
      showOverlay(data, index);
      Overlay.of(context).insert(_overlayEntryList[index]!);
      homeStore.isOpen = true;
    }
  }

  void _removeOverlay(int index) {
    _overlayEntryList[index]?.remove();
    _overlayEntryList[index] = null;
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
                      // _buildFilterRow(),
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
                            return customTopCoachDataChip(coach!);
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
                          return customOtherCoachDataChip(coach!);
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

  Widget _buildFilterRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CustomIconButton(
            child: SvgPicture.asset(
              Assets.images.home.filter.path,
              height: 24.h,
              width: 24.w,
            ),
          ),
          10.horizontalSpace,
          _buildFilterChip(
            icon: Assets.images.home.cricket.path,
            text: homeStore.filters!.sports!,
            index: 0,
          ),
          10.horizontalSpace,
          _buildFilterChip(
            icon: Assets.images.home.coach.path,
            text: homeStore.filters!.coachingTypes!,
            index: 1,
          ),
          10.horizontalSpace,
        ],
      ),
    );
  }

  Widget _buildFilterChip({
    required String icon,
    required List<String> text,
    required int index,
  }) {
    return Observer(
      builder: (context) => InkWell(
        borderRadius: BorderRadius.circular(40.r),
        onTap: () {
          toggleOverlay(text, index);
        },
        child: CompositedTransformTarget(
          link: _layerLinkList[index],
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
            decoration: BoxDecoration(
              color: AppColors.transparent,
              borderRadius: BorderRadius.circular(40.r),
              border: Border.all(color: AppColors.borderColor, width: 1),
            ),
            child: Row(
              children: [
                SvgPicture.asset(icon, width: 20.w, height: 20.h),
                4.horizontalSpace,
                Text(
                  homeStore.selectedSport,
                  style: mediumText.copyWith(
                    fontSize: 14.spMin,
                    color: AppColors.textSecondaryColor,
                  ),
                ),
                4.horizontalSpace,
                SvgPicture.asset(
                  Assets.images.home.downArrow.path,
                  width: 20.w,
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomDropDown(List<String> text, int inde) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.borderColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      width: 100.w,
      height: 100.h,
      padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 2.h),
      child: ListView.builder(
        padding: .zero,
        shrinkWrap: true,
        itemCount: text.length,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.all(8.r),
          margin: EdgeInsets.only(bottom: 4.h),
          decoration: BoxDecoration(),
          child: GestureDetector(
            onTap: () {
              homeStore.selectedSport = text[index];
              _removeOverlay(inde);
            },
            child: Text(
              text[index],
              style: mediumText.copyWith(
                color: AppColors.whiteColor,
                decoration: TextDecoration.none,
                fontSize: 14.spMin,
              ),
            ),
          ),
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
