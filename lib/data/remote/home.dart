import 'package:april_29_exam/core/api/api_end_point.dart';
import 'package:april_29_exam/core/api/base_response/base_response.dart';
import 'package:april_29_exam/data/model/request/sign_in_request.dart';
import 'package:april_29_exam/data/model/request/signup_request.dart';
import 'package:april_29_exam/data/model/response/coach_data_response.dart';
import 'package:april_29_exam/data/model/response/sign_in_response.dart';
import 'package:april_29_exam/data/model/response/signup_responce.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'home.g.dart';

@RestApi()
abstract class HomeApi {
  factory HomeApi(Dio dio) = _HomeApi;

  @GET("/coaches")
  Future<BaseResponse<CoacheDataResponse>> coaches();
}
