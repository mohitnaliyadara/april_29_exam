import 'package:april_29_exam/data/model/response/coach_details_response.dart';
import 'package:april_29_exam/ui/home/coach_profile/store/coach_profile_store.dart';
import 'package:april_29_exam/values/app_colors.dart';
import 'package:april_29_exam/values/app_text_style.dart';
import 'package:april_29_exam/widget/app_filled_button.dart';

import 'package:april_29_exam/widget/app_outline_button.dart';
import 'package:april_29_exam/widget/custom_image_box.dart';
import 'package:april_29_exam/widget/custom_join_button.dart';
import 'package:april_29_exam/widget/custom_text_button.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/api/base_response/base_response.dart';
import '../../../../generated/assets.dart';
import '../../../../widget/custom_app_bar.dart';
import '../../../../widget/custom_icon_button.dart';
import '../../../../widget/custom_snackbar.dart';

@RoutePage()
class CoachProfileScreenPage extends StatefulWidget {
  final int id;
  const CoachProfileScreenPage({super.key, required this.id});

  @override
  State<CoachProfileScreenPage> createState() => _CoachProfileScreenPageState();
}

class _CoachProfileScreenPageState extends State<CoachProfileScreenPage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  List<ReactionDisposer>? _disposer;

  @override
  void initState() {
    coachProfileStore.fetchCoachDetails(widget.id);
    tabController = TabController(length: 3, vsync: this);
    super.initState();
    addDisposer();

    // TODO: implement initState
  }

  void addDisposer() {
    _disposer ??= [
      reaction((_) => coachProfileStore.coachDetailsResponse, (
        BaseResponse<CoachDetailsResponse>? response,
      ) {
        coachProfileStore.isLoading = false;

        if (response?.code == "200") {
          coachProfileStore.coachDetails = response?.data;
          // showSnackBar(message: response?.message.toString() ?? "");
        }
      }),

      reaction((_) => coachProfileStore.errorMessage, (String? message) {
        coachProfileStore.isLoading = false;
        if (coachProfileStore.errorMessage != null) {
          showSnackBar(message: message ?? "");
        }
      }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: _buildAppBar(),
      body: Observer(
        builder: (context) => coachProfileStore.coachDetailsResponse == null
            ? Center(child: CircularProgressIndicator())
            : coachProfileStore.errorMessage != null
            ? Center(
                child: Text(
                  coachProfileStore.errorMessage.toString(),
                  style: boldText.copyWith(color: AppColors.whiteColor),
                ),
              )
            : Column(
                children: [
                  //profile card
                  16.verticalSpace,
                  _buildCoachProfileCard(),

                  30.verticalSpace,

                  // tab bar
                  _buildTabBar(),
                  24.verticalSpace,
                  // tab bar view
                  _buildTabBarView(),

                  // submit button
                ],
              ),
      ),
    );
  }

  // app bar
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 90.w,
      leading: Container(
        margin: EdgeInsets.only(left: 16.w),
        child: InkWell(
            onTap:(){
              context.router.pop();
            },
            child: SvgPicture.asset(Assets.images.home.rally.path)),
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

  // coach cart
  Widget _buildCoachProfileCard() {
    return SizedBox(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 125.h,
                width: 125.w,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: customImageBox(
                  image: coachProfileStore.coachDetails?.imageUrl ?? "",
                  color: AppColors.borderColor,
                ),
              ),
              15.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          coachProfileStore.coachDetails?.name ?? "Unknow",
                          style: semiBoldText.copyWith(
                            color: AppColors.whiteColor,
                          ),
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
                      coachProfileStore.coachDetails?.bio ?? "",
                      style: regularText.copyWith(
                        color: AppColors.whiteColor,
                        fontSize: 12.spMin,
                      ),
                      maxLines: 5,
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
                          coachProfileStore.coachDetails?.rating.toString() ??
                              "0",
                          style: semiBoldText.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                        5.horizontalSpace,
                        Text(
                          "(${coachProfileStore.coachDetails?.reviewsCount.toString()})",
                          style: semiBoldText.copyWith(
                            color: AppColors.borderColor,
                          ),
                        ),
                      ],
                    ),
                    9.verticalSpace,
                    Row(
                      children: [
                        SvgPicture.asset(
                          Assets.images.home.distance.path,
                          height: 20.h,
                          width: 20.w,
                        ),
                        5.horizontalSpace,
                        Text(
                          "${coachProfileStore.coachDetails?.distanceKm.toString()} Kms away",
                          style: regularText.copyWith(
                            color: AppColors.textGreyTeraryColor,
                          ),
                        ),
                      ],
                    ),
                    8.verticalSpace,
                    Row(
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
                  ],
                ),
              ),
            ],
          ),
          17.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 44.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      coachProfileStore.coachDetails?.followersCount
                              .toString() ??
                          "0",
                      style: semiBoldText.copyWith(
                        color: AppColors.whiteColor,
                        fontSize: 24.spMin,
                      ),
                    ),
                    Text(
                      "Followers",
                      style: regularText.copyWith(
                        color: AppColors.borderColor,
                        fontSize: 12.spMin,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      coachProfileStore.coachDetails?.studentsCount
                              .toString() ??
                          "0",
                      style: semiBoldText.copyWith(
                        color: AppColors.whiteColor,
                        fontSize: 24.spMin,
                      ),
                    ),
                    Text(
                      "Students",
                      style: regularText.copyWith(
                        color: AppColors.borderColor,
                        fontSize: 12.spMin,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      coachProfileStore.coachDetails?.sessionsCount
                              .toString() ??
                          "0",
                      style: semiBoldText.copyWith(
                        color: AppColors.whiteColor,
                        fontSize: 24.spMin,
                      ),
                    ),
                    Text(
                      "AED/hr",
                      style: regularText.copyWith(
                        color: AppColors.borderColor,
                        fontSize: 12.spMin,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          24.verticalSpace,

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Expanded(
                  child: AppOutlineButton(
                    text: "Follow",
                    onPressed: () {},
                    borderColor: AppColors.primaryColor,
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: AppOutlineButton(
                    text: "Message",
                    onPressed: () {},
                    textStyle: regularText.copyWith(
                      color: AppColors.textGreyTeraryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: tabController,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: AppColors.primaryColor,
      labelColor: AppColors.primaryColor,
      labelPadding: EdgeInsets.only(bottom: 18.h),
      indicatorAnimation: TabIndicatorAnimation.linear,
      labelStyle: semiBoldText.copyWith(
        fontSize: 14.spMin,
        color: AppColors.primaryColor,
      ),
      unselectedLabelColor: AppColors.textGreyTeraryColor,
      unselectedLabelStyle: semiBoldText.copyWith(
        fontSize: 14.spMin,
        color: AppColors.textGreyTeraryColor,
      ),
      tabs: [Text("Coaching"), Text("Posts"), Text("About")],
    );
  }

  Widget _buildTabBarView() {
    return Expanded(
      child: TabBarView(
        controller: tabController,
        children: [
          _buildCoachSportDetails(),
          _buildCoachSportDetails(),
          _buildCoachSportDetails(),
        ],
      ),
    );
  }

  Widget _buildCoachSportDetails() {
    final sport = coachProfileStore.coachDetails?.sports;
    final coachingType = coachProfileStore.coachDetails?.coachingType;
    final availableTimeSloat =
        coachProfileStore.coachDetails?.availableTimeSlots;
    final levelOfCoaching =
        coachProfileStore.coachDetails?.availableLevelOfCoaching;
    final locations = coachProfileStore.coachDetails?.locations;
    final availableGroupSessions =
        coachProfileStore.coachDetails?.availableGroupSessions;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Sport",
              style: semiBoldText.copyWith(color: AppColors.whiteColor),
            ),
            16.verticalSpace,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 12.w,
                children: List.generate(
                  sport?.length ?? 0,
                  (index) => _buildCustomChip(text: sport?[index] ?? ""),
                ),
              ),
            ),
            33.verticalSpace,
            Text(
              "Select type of coaching",
              style: semiBoldText.copyWith(color: AppColors.whiteColor),
            ),
            18.verticalSpace,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 16.w,
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                  coachingType?.length ?? 0,
                  (index) => _buildCustomChip(text: coachingType?[index] ?? ""),
                ),
              ),
            ),
            32.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Select Date",
                  style: semiBoldText.copyWith(color: AppColors.whiteColor),
                ),
                CustomTextButton(
                  text: "Calender",
                  onPressed: () {},
                  textStyle: regularText.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: 14.spMin,
                  ),
                ),
              ],
            ),
            Row(
              children: [_buildDateView(), _buildDateView(), _buildDateView()],
            ),
            32.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Select Time",
                  style: semiBoldText.copyWith(color: AppColors.whiteColor),
                ),
                CustomTextButton(
                  text: "See All",
                  onPressed: () {},
                  textStyle: regularText.copyWith(
                    color: AppColors.textGreyTeraryColor,
                    fontSize: 14.spMin,
                  ),
                ),
              ],
            ),
            16.verticalSpace,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 8.w,
                children: List.generate(
                  availableTimeSloat?.length ?? 0,
                  (index) =>
                      _buildCustomChip(text: availableTimeSloat?[index] ?? ""),
                ),
              ),
            ),
            32.verticalSpace,
            Text(
              "Select Number of People",
              style: semiBoldText.copyWith(color: AppColors.whiteColor),
            ),
            16.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Observer(
                  builder: (context) => Row(
                    children: List.generate(
                      coachProfileStore.numberOfPeople,
                      (index) => _buildCustomChip(
                        text: "${index + 1}",
                        shape: BoxShape.circle,
                        margin: EdgeInsets.only(right: 5.w),
                        height: 40.h,
                        width: 40.w,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    AppOutlineButton(
                      onPressed: () {
                        if (coachProfileStore.numberOfPeople > 1) {
                          coachProfileStore.numberOfPeople--;
                        } else {
                          showSnackBar(message: "Minimum 1 person");
                        }
                      },
                      width: 30,
                      child: Icon(Icons.remove, color: AppColors.whiteColor),
                    ),
                    8.horizontalSpace,
                    Observer(
                      builder: (context) => Text(
                        coachProfileStore.numberOfPeople.toString(),
                        style: regularText.copyWith(
                          fontSize: 15.spMin,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                    8.horizontalSpace,
                    AppOutlineButton(
                      onPressed: () {
                        // max 6
                        if (coachProfileStore.numberOfPeople < 6) {
                          coachProfileStore.numberOfPeople++;
                        } else {
                          showSnackBar(message: "Maximum 6 person");
                        }
                      },
                      width: 30,
                      child: Icon(Icons.add, color: AppColors.whiteColor),
                    ),
                  ],
                ),
              ],
            ),
            32.verticalSpace,
            Text(
              "Select Level of Coaching",
              style: semiBoldText.copyWith(color: AppColors.whiteColor),
            ),
            16.verticalSpace,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 16.w,
                children: List.generate(
                  levelOfCoaching?.length ?? 0,
                  (index) => _buildCustomChip(
                    text: levelOfCoaching?[index] ?? "",
                    icon: Assets.images.home.bookMark.path,
                  ),
                ),
              ),
            ),
            32.verticalSpace,
            Text(
              "Select Location",
              style: semiBoldText.copyWith(color: AppColors.whiteColor),
            ),
            16.verticalSpace,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 16.w,
                children: List.generate(
                  locations?.length ?? 0,
                  (index) => _buildLocationChip(locations![index]),
                ),
              ),
            ),
            32.verticalSpace,
            Text(
              "Available Groups Sessions",
              style: semiBoldText.copyWith(color: AppColors.whiteColor),
            ),
            16.verticalSpace,
            _buildAvailableGroupSession(availableGroupSessions!),
            32.verticalSpace,
            Text(
              "Select Package (optional)",
              style: semiBoldText.copyWith(color: AppColors.whiteColor),
            ),
            16.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: _buildPackageDetails(
                    date: "5",
                    timing: "60",
                    onTap: () {},
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: _buildPackageDetails(
                    date: "5",
                    timing: "60",
                    onTap: () {},
                  ),
                ),
              ],
            ),
            35.verticalSpace,
            AppFilledButton(
              onPressed: () {},
              child: Text(
                "Book Session",
                style: semiBoldText.copyWith(color: AppColors.backgroundColor),
              ),
            ),
            15.verticalSpace,
          ],
        ),
      ),
    );
  }

  Widget _buildCustomChip({
    required String text,
    BoxShape? shape,
    double? borderRadius,
    EdgeInsetsGeometry? margin,
    double? height,
    double? width,
    String? icon,
  }) {
    switch (text) {
      case "Cricket":
        icon = Assets.images.home.cricket.path;
      case "Padel":
        icon = Assets.images.home.badminton.path;
      case "Table Tennis":
        icon = Assets.images.home.tt.path;
    }
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      margin: margin,
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
      decoration: BoxDecoration(
        shape: shape ?? BoxShape.rectangle,
        color: AppColors.transparent,
        borderRadius: shape == null
            ? BorderRadius.circular(borderRadius ?? 40.r)
            : null,
        border: Border.all(color: AppColors.borderColor, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) SvgPicture.asset(icon, width: 20.w, height: 20.h),
          if (icon != null) 4.horizontalSpace,
          Text(
            text,
            style: mediumText.copyWith(
              fontSize: 14.spMin,
              color: AppColors.textSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateView() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 24.h),
      margin: EdgeInsets.only(right: 8.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor, width: 1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          Text(
            "WED",
            style: regularText.copyWith(
              fontSize: 14.spMin,
              color: AppColors.textGreyTeraryColor,
            ),
          ),
          Text(
            "06",
            style: regularText.copyWith(
              fontSize: 14.spMin,
              color: AppColors.textGreyTeraryColor,
            ),
          ),
          Text(
            "Sep",
            style: regularText.copyWith(
              fontSize: 14.spMin,
              color: AppColors.textGreyTeraryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationChip(Location location) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.textGreyTeraryColor),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
            child: customImageBox(
              image: location.imageUrl ?? "",
              color: AppColors.whiteColor,
              width: 70.w,
              height: 70.h,
            ),
          ),
          8.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                location.name ?? "",
                style: semiBoldText.copyWith(color: AppColors.whiteColor),
                maxLines: 1,
              ),
              Text(
                "(${location.distanceKm}kms away from you)",
                style: regularText.copyWith(
                  color: AppColors.textGreyTeraryColor,
                  fontSize: 12.spMin,
                ),
              ),
              8.verticalSpace,
              Row(
                children: [
                  SvgPicture.asset(Assets.images.home.latter.path),
                  9.horizontalSpace,
                  Text(
                    "AED 2345",
                    style: regularText.copyWith(
                      color: AppColors.whiteColor,
                      fontSize: 14.spMin,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAvailableGroupSession(AvailableGroupSessions session) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.containerBackColor,

        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.whiteColor, width: 0.5),
      ),
      child: Column(
        spacing: 16.h,
        children: [
          _buildCustomTextShow(
            icon: Assets.images.home.cricket.path,
            sport: session.sport ?? "",
          ),

          _buildCustomTextShow(
            icon: Assets.images.home.calendar.path,
            sport: session.timing ?? "",
          ),
          _buildCustomTextShow(
            icon: Assets.images.home.gender.path,
            sport: "${session.gender} (18 - 25 Years only)",
          ),
          _buildCustomTextShow(
            icon: Assets.images.home.bookMark.path,
            sport: session.levelOfCoaching ?? "",
          ),
          _buildCustomTextShow(
            icon: Assets.images.home.location.path,
            sport: session.location ?? "",
          ),
          _buildCustomTextShow(
            icon: Assets.images.home.latter.path,
            sport: session.sessionsCount ?? "",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Members(${session.availableMembers}/${session.totalMembers})",
                style: semiBoldText.copyWith(color: AppColors.whiteColor),
              ),
              AppOutlineButton(
                onPressed: () {},
                width: 80.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(Assets.images.home.chat.path),
                    Text(
                      "Chat",
                      style: semiBoldText.copyWith(
                        color: AppColors.whiteColor,
                        fontSize: 14.spMin,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 10.w,
                    children: List.generate(session.members?.length ?? 0, (
                      index,
                    ) {
                      final members = session.members?[index];
                      return Column(
                        spacing: 5.h,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          customImageBox(
                            image: members?.imageUrl ?? "",
                            width: 50.w,
                            height: 50.h,
                            boxShape: BoxShape.circle,

                            color: AppColors.borderColor,
                          ),
                          Text(
                            members?.name ?? "Unknow",
                            style: semiBoldText.copyWith(
                              color: AppColors.whiteColor,
                              fontSize: 12.spMin,
                            ),
                            maxLines: 1,
                          ),
                          Text(
                            members?.levelOfCoaching ?? "0",
                            style: regularText.copyWith(
                              color: AppColors.whiteColor,
                              fontSize: 12.spMin,
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
              16.horizontalSpace,
              Container(
                height: 50.h,
                width: 1.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.r),
                  color: AppColors.whiteColor,
                ),
              ),
              16.horizontalSpace,
              customJoinButton(
                child: Icon(Icons.add, color: AppColors.primaryColor),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCustomTextShow({required String icon, required String sport}) {
    return Row(
      children: [
        SvgPicture.asset(icon, height: 20.h, width: 20.w),
        16.horizontalSpace,
        Text(
          sport,
          style: regularText.copyWith(
            color: AppColors.textGreyTeraryColor,
            fontSize: 14.spMin,
          ),
        ),
      ],
    );
  }

  Widget _buildPackageDetails({
    required String? date,
    required String? timing,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.containerBackColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.whiteColor, width: 0.5),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(Assets.images.home.calendar.path),
              8.horizontalSpace,
              Text(
                "$date Sessions",
                style: regularText.copyWith(
                  color: AppColors.whiteColor,
                  fontSize: 14.spMin,
                ),
              ),
            ],
          ),
          10.verticalSpace,
          Row(
            children: [
              SvgPicture.asset(Assets.images.home.calendar.path),
              8.horizontalSpace,
              Text(
                "$date Sessions",
                style: regularText.copyWith(
                  color: AppColors.whiteColor,
                  fontSize: 14.spMin,
                ),
              ),
            ],
          ),
          10.verticalSpace,
          Divider(color: AppColors.secondDividerColor),
          Row(
            children: [
              SvgPicture.asset(Assets.images.home.latter.path),
              8.horizontalSpace,
              Text(
                "AED 2345 ",
                style: regularText.copyWith(
                  color: AppColors.whiteColor,
                  fontSize: 14.spMin,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
