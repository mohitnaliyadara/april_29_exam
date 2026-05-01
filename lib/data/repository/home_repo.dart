import 'package:april_29_exam/core/api/base_response/base_response.dart';
import 'package:april_29_exam/data/model/response/coach_data_response.dart';

import '../model/response/coach_details_response.dart';

abstract class HomeRepo {
  Future<BaseResponse<CoacheDataResponse>> coaches();
  Future<BaseResponse<CoachDetailsResponse>> coachDetails(int id);
}
