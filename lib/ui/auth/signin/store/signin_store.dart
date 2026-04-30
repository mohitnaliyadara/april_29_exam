import 'package:april_29_exam/core/api/base_response/base_response.dart';
import 'package:april_29_exam/core/api/exceptions/app_exceptions.dart';
import 'package:april_29_exam/data/model/response/sign_in_response.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/api/locator/locator.dart';
import '../../../../data/model/request/sign_in_request.dart';
import '../../../../data/repo_impl/auth_repo_impl.dart';

part 'signin_store.g.dart';

class SigninStore = _SigninStore with _$SigninStore;

SigninStore signinStore = SigninStore();

abstract class _SigninStore with Store {
  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  bool visiblePassword = true;

  @observable
  BaseResponse<SignInResponse>? signInResponse;

  @action
  Future<void> signIn(SignInRequest request) async {
    try {
      isLoading = true;
      errorMessage = null;
      signInResponse = await locator<AuthRepoImpl>().signin(request);
    } on AppException catch (e) {
      errorMessage = e.message;
    } on DioException catch (e) {
      errorMessage = e.toString();
    } catch (e) {
      errorMessage = e.toString();
    }
  }
}
