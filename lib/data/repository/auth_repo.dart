import 'package:april_29_exam/core/api/base_response/base_response.dart';
import 'package:april_29_exam/data/model/request/sign_in_request.dart';
import 'package:april_29_exam/data/model/request/signup_request.dart';
import 'package:april_29_exam/data/model/response/sign_in_response.dart';
import 'package:april_29_exam/data/model/response/signup_responce.dart';

abstract class AuthRepo {
  Future<BaseResponse<SignupResponse>> signup(SignupRequest request);
  Future<BaseResponse<SignInResponse>> signin(SignInRequest request);
 }