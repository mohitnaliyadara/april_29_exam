import 'dart:developer';

import 'package:april_29_exam/core/api/base_response/base_response.dart';
import 'package:april_29_exam/core/api/exceptions/app_exceptions.dart';
import 'package:april_29_exam/data/model/request/signup_request.dart';
import 'package:april_29_exam/data/model/response/signup_responce.dart';
import 'package:april_29_exam/data/repo_impl/auth_repo_impl.dart';
import 'package:april_29_exam/widget/custom_snackbar.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/api/locator/locator.dart';

part 'signup_store.g.dart';

class SignupStore = _SignupStore with _$SignupStore;

SignupStore signupStore = SignupStore();

abstract class _SignupStore with Store {
  @observable
  String countryCode = "+91";

  @observable
  bool visiblePassword = true;

  @observable
  BaseResponse<SignupResponse>? signupResponse;

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  bool confirmVisiblePassword = true;

  @observable
  bool? checkBoxValue = false;

  @action
  void setCountryCode(String? value) {
    countryCode = "+$value";
  }

  @action
  Future<void> signUp(SignupRequest request) async {
    try {
      isLoading = true;
      errorMessage = null;
      signupResponse = await locator<AuthRepoImpl>().signup(request);

    } on AppException catch (e) {
      showSnackBar(message: e.toString());
    } on DioException catch (e) {
      showSnackBar(message: e.toString());
    }
  }
}
