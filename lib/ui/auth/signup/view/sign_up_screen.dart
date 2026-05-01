import 'dart:developer';

import 'package:april_29_exam/core/api/base_response/base_response.dart';
import 'package:april_29_exam/core/api/db/app_db.dart';
import 'package:april_29_exam/data/model/request/signup_request.dart';
import 'package:april_29_exam/data/model/response/signup_responce.dart';
import 'package:april_29_exam/generated/assets.dart';
import 'package:april_29_exam/routes/app_routes.dart';
import 'package:april_29_exam/ui/auth/signin/view/sign_in_screen.dart';
import 'package:april_29_exam/ui/auth/signup/store/signup_store.dart';
import 'package:april_29_exam/values/app_colors.dart';
import 'package:april_29_exam/values/app_text_style.dart';
import 'package:april_29_exam/values/custom_check_box.dart';
import 'package:april_29_exam/values/validation.dart';
import 'package:april_29_exam/widget/app_filled_button.dart';
import 'package:april_29_exam/widget/app_text_filed.dart';
import 'package:april_29_exam/widget/custom_app_bar.dart';
import 'package:april_29_exam/widget/custom_icon_button.dart';
import 'package:april_29_exam/widget/custom_text_button.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobx/mobx.dart';

import '../../../../widget/custom_snackbar.dart';
@RoutePage()
class SignUpScreenPage extends StatefulWidget {
  const SignUpScreenPage({super.key});

  @override
  State<SignUpScreenPage> createState() => _SignUpScreenPageState();
}

class _SignUpScreenPageState extends State<SignUpScreenPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  late final FocusNode _nameFocusNode;
  late final FocusNode _emailFocusNode;
  late final FocusNode _phoneFocusNode;
  late final FocusNode _passwordFocusNode;
  late final FocusNode _confirmPasswordFocusNode;

  List<ReactionDisposer>? _disposer;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _phoneController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    _nameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _phoneFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
    addDisposer();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();

    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _phoneFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _disposer?.forEach((element) => element.reaction.dispose());

    // TODO: implement dispose
    super.dispose();
  }

  void submit() {
    final result =
        usernameValidation(_nameController.text.trim()) ??
        emailValidation(_emailController.text.trim()) ??
        phoneValidation(_phoneController.text.trim()) ??
        passwordValidation(_passwordController.text.trim()) ??
        confirmPasswordValidation(
          _confirmPasswordController.text.trim(),
          _passwordController.text.trim(),
        );

    if (result != null) {
      showSnackBar(message: result);
    } else if (signupStore.checkBoxValue == false) {
      showSnackBar(message: "Please accept the terms and conditions");
    } else {
      final request = SignupRequest(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        fullName: _nameController.text.trim(),
        phone: "${signupStore.countryCode}${_phoneController.text.trim()}",
      );
      signupStore.signUp(request);
    }
  }

  void addDisposer() {
    _disposer ??= [
      reaction((_) => signupStore.signupResponse, (
        BaseResponse<SignupResponse>? response,
      ) {
        signupStore.isLoading = false;

        if (response?.code == "200") {
          showSnackBar(message: response?.message.toString() ?? "");
          context.router.replaceAll([ HomeScreenRoute()]);
        }
      }),

      reaction((_) => signupStore.errorMessage, (String? message) {
        signupStore.isLoading = false;
        if (signupStore.errorMessage != null) {
          showSnackBar(message: message ?? "");
          appDB.isLogin = true;
        }
      }),
    ];


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(
        leading: CustomIconButton(
          onTap: () {
            context.router.pop();
          },
          child: Image.asset(Assets.images.icons.backArrow.path),
        ),
        height: 222.h,
        bottom: Container(
          height: 131.h,
          alignment: .topCenter,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Container(
                  height: 60.h,
                  width: 4.w,
                  color: AppColors.primaryColor,
                ),
              ),
              15.horizontalSpace,
              Text(
                "Create Account",
                style: semiBoldText.copyWith(
                  fontSize: 22.spMin,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.verticalSpace,
              Text(
                "Full Name",
                style: regularText.copyWith(
                  fontSize: 14.spMin,
                  color: AppColors.textTertiaryColor,
                ),
              ),
              10.verticalSpace,
              AppTextFiled(
                prefixIcon: Assets.images.icons.person.path,
                controller: _nameController,
                autoFocus: true,
                inputFormatters: [LengthLimitingTextInputFormatter(25)],
                focusNode: _nameFocusNode,
                nextFocusNode: _emailFocusNode,
              ),
              15.verticalSpace,
              Text(
                "Email",
                style: regularText.copyWith(
                  fontSize: 14.spMin,
                  color: AppColors.textTertiaryColor,
                ),
              ),
              10.verticalSpace,
              AppTextFiled(
                prefixIcon: Assets.images.icons.email.path,
                controller: _emailController,
                keyBoardType: TextInputType.emailAddress,
                inputFormatters: [LengthLimitingTextInputFormatter(40)],
                focusNode: _emailFocusNode,
                nextFocusNode: _phoneFocusNode,
              ),
              15.verticalSpace,
              Text(
                "Mobile",
                style: regularText.copyWith(
                  fontSize: 14.spMin,
                  color: AppColors.textTertiaryColor,
                ),
              ),
              10.verticalSpace,
              AppTextFiled(
                prefixIcon: Assets.images.icons.phone.path,
                controller: _phoneController,
                showCountryCode: true,
                keyBoardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  //  FilteringTextInputFormatter.allow(RegExp(r'^[0-9]{')),
                ],
                focusNode: _phoneFocusNode,
                nextFocusNode: _passwordFocusNode,
              ),
              15.verticalSpace,
              Text(
                "Password",
                style: regularText.copyWith(
                  fontSize: 14.spMin,
                  color: AppColors.textTertiaryColor,
                ),
              ),
              10.verticalSpace,
              Observer(
                builder: (context) => AppTextFiled(
                  prefixIcon: Assets.images.icons.password.path,
                  controller: _passwordController,
                  keyBoardType: TextInputType.visiblePassword,
                  obscureText: signupStore.visiblePassword,
                  focusNode: _passwordFocusNode,
                  nextFocusNode: _confirmPasswordFocusNode,

                  suffixIcon: IconButton(
                    onPressed: () {
                      signupStore.visiblePassword =
                          !signupStore.visiblePassword;
                    },
                    icon: Icon(
                      signupStore.visiblePassword == false
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),
              ),
              15.verticalSpace,
              Text(
                "Password",
                style: regularText.copyWith(
                  fontSize: 14.spMin,
                  color: AppColors.textTertiaryColor,
                ),
              ),
              10.verticalSpace,
              Observer(
                builder: (context) => AppTextFiled(
                  prefixIcon: Assets.images.icons.password.path,
                  controller: _confirmPasswordController,
                  keyBoardType: TextInputType.visiblePassword,
                  obscureText: signupStore.confirmVisiblePassword,
                  focusNode: _confirmPasswordFocusNode,
                  suffixIcon: IconButton(
                    onPressed: () {
                      signupStore.confirmVisiblePassword =
                          !signupStore.confirmVisiblePassword;
                    },
                    icon: Icon(
                      signupStore.confirmVisiblePassword == false
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),
              ),
              15.verticalSpace,
              Observer(
                builder: (context) => Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomCheckBox(
                      onChanged: (value) =>
                          signupStore.checkBoxValue = value ?? false,
                      value: signupStore.checkBoxValue,
                    ),
                    15.horizontalSpace,
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 15.w),
                        child: Text.rich(
                          maxLines: 2,

                          overflow: TextOverflow.ellipsis,
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "By continuing, you agree to the",
                                style: regularText.copyWith(fontSize: 14.spMin),
                              ),
                              TextSpan(
                                text: " Terms of services",
                                style: boldText.copyWith(fontSize: 14.spMin),
                              ),
                              TextSpan(
                                text: " and",
                                style: regularText.copyWith(fontSize: 14.spMin),
                              ),
                              TextSpan(
                                text: " Privacy Policy",
                                style: boldText.copyWith(fontSize: 14.spMin),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              AppFilledButton(text: "Sign Up", onPressed: submit),
              29.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: regularText.copyWith(fontSize: 14.spMin),
                  ),
                  10.horizontalSpace,
                  CustomTextButton(
                    text: "Log In",
                    onPressed: () {
                      context.router.pop();
                    },

                    textStyle: semiBoldText.copyWith(fontSize: 15.spMin),
                  ),
                ],
              ),
              15.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
