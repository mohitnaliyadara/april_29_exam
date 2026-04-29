import 'package:april_29_exam/core/api/base_response/base_response.dart';
import 'package:april_29_exam/data/model/request/signup_request.dart';
import 'package:april_29_exam/data/model/response/signup_responce.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'auth.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio) = _AuthApi;

  @POST("/signup")
  Future<BaseResponse<SignupResponse>> signup(@Body() SignupRequest request);
}
