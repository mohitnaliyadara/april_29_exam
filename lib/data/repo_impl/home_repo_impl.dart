import 'package:april_29_exam/core/api/base_response/base_response.dart';
import 'package:april_29_exam/data/model/response/coach_data_response.dart';
import 'package:april_29_exam/data/repository/home_repo.dart';

import '../model/response/coach_details_response.dart';
import '../remote/home.dart';

class HomeRepoImpl extends HomeRepo {
  HomeApi homeApi;
  HomeRepoImpl({required this.homeApi});
  @override
  Future<BaseResponse<CoacheDataResponse>> coaches() async {
    final BaseResponse<CoacheDataResponse> response = await homeApi.coaches();
    return response;
  }

  @override
  Future<BaseResponse<CoachDetailsResponse>> coachDetails(int id) async {
    final BaseResponse<CoachDetailsResponse> response = await homeApi
        .coachDetails(id);
    return response;
  }
}
