import 'package:april_29_exam/core/api/base_response/base_response.dart';
import 'package:april_29_exam/core/api/locator/locator.dart';
import 'package:april_29_exam/data/model/request/signup_request.dart';
import 'package:april_29_exam/data/model/response/signup_responce.dart';
import 'package:april_29_exam/data/repository/auth_repo.dart';

import '../remote/auth.dart';

class AuthRepoImpl extends AuthRepo {
  AuthApi authApi;

  AuthRepoImpl({required this.authApi});
  @override
  Future<BaseResponse<SignupResponse>> signup(SignupRequest request) async {
    final BaseResponse<SignupResponse> response = await authApi.signup(request);
    return response;
  }
}
