import 'package:april_29_exam/data/model/response/sign_in_response.dart';
import 'package:april_29_exam/ui/auth/signin/store/signin_store.dart';
import 'package:april_29_exam/widget/custom_icon_button.dart';
import 'package:april_29_exam/widget/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/api/base_response/base_response.dart';
import '../../../../core/api/db/app_db.dart';
import '../../../../data/model/request/sign_in_request.dart';
import '../../../../generated/assets.dart';
import '../../../../values/app_colors.dart';
import '../../../../values/app_text_style.dart';
import '../../../../values/validation.dart';
import '../../../../widget/app_filled_button.dart';
import '../../../../widget/app_text_filed.dart';
import '../../../../widget/custom_app_bar.dart';
import '../../../../widget/custom_text_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;
  List<ReactionDisposer>? _disposer;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    addDisposer();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _disposer?.forEach((element) => element.reaction.dispose());
    // TODO: implement dispose
    super.dispose();
  }

  void submit() {
    var result =
        emailLoginValidation(_emailController.text.trim()) ??
        passwordLoginValidation(_passwordController.text.trim());

    if (result != null) {
      showSnackBar(message: result);
    } else {
      signinStore.signIn(
        SignInRequest(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        ),
      );
    }
  }

  void addDisposer() {
    _disposer ??= [
      reaction((_) => signinStore.signInResponse, (
        BaseResponse<SignInResponse>? response,
      ) {
        signinStore.isLoading = false;

        if (response?.code == "200") {
          showSnackBar(message: response?.message.toString() ?? "");
        }
      }),

      reaction((_) => signinStore.errorMessage, (String? message) {
        signinStore.isLoading = false;
        if (signinStore.errorMessage != null) {
          showSnackBar(message: message ?? "");
          appDB.isLogin = true;
        }
      }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
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
                "Hello !",
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
                  obscureText: signinStore.visiblePassword,
                  focusNode: _passwordFocusNode,

                  suffixIcon: Padding(
                    padding: EdgeInsets.all(13.r),
                    child: CustomIconButton(
                      child: signinStore.visiblePassword == false
                          ? Image.asset(Assets.images.icons.eye.path)
                          : Image.asset(Assets.images.icons.eyeOff.path),
                      onTap: () => signinStore.visiblePassword =
                          !signinStore.visiblePassword,
                    ),
                  ),
                ),
              ),
              20.verticalSpace,
              AppFilledButton(text: "Log in", onPressed: submit),
              350.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account?",
                    style: regularText.copyWith(fontSize: 14.spMin),
                  ),
                  10.horizontalSpace,
                  CustomTextButton(
                    text: "Sign up",
                    onPressed: () {},
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

// i am starting
