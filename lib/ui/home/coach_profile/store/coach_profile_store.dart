import 'package:april_29_exam/core/api/base_response/base_response.dart';
import 'package:april_29_exam/core/api/exceptions/app_exceptions.dart';
import 'package:april_29_exam/core/api/exceptions/dio_exception_util.dart';
import 'package:april_29_exam/core/api/locator/locator.dart';
import 'package:april_29_exam/data/repo_impl/home_repo_impl.dart';
import 'package:mobx/mobx.dart';

import '../../../../data/model/response/coach_details_response.dart';

part 'coach_profile_store.g.dart';

class CoachProfileStore = _CoachProfileStore with _$CoachProfileStore;

CoachProfileStore coachProfileStore = CoachProfileStore();

abstract class _CoachProfileStore with Store {
  @observable
  bool isLoading = false;

  @observable
  BaseResponse<CoachDetailsResponse>? coachDetailsResponse;

  @observable
  CoachDetailsResponse? coachDetails;

  @observable
  String? errorMessage;

  @observable
  int numberOfPeople = 5;

  Future<void> fetchCoachDetails(int id) async {
    try {
      isLoading = true;
      errorMessage = null;
      coachDetailsResponse = await locator<HomeRepoImpl>().coachDetails(id);
      isLoading = false;
    } on AppException catch (e) {
      isLoading = false;
      errorMessage = e.message;
    } on DioExceptionUtil catch (e) {
      isLoading = false;
      errorMessage = e.toString();
    } catch (e) {
      isLoading = false;
      errorMessage = e.toString();
    }
  }
}
