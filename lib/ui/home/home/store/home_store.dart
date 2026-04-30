import 'dart:developer';

import 'package:april_29_exam/core/api/base_response/base_response.dart';
import 'package:april_29_exam/core/api/exceptions/app_exceptions.dart';
import 'package:april_29_exam/core/api/locator/locator.dart';
import 'package:april_29_exam/data/model/response/coach_data_response.dart';
import 'package:april_29_exam/data/repo_impl/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

HomeStore homeStore = HomeStore();

abstract class _HomeStore with Store {
  @observable
  bool isLoading = false;

  @observable
  BaseResponse<CoacheDataResponse>? coachDataResponse;

  @observable
  Filters? filters;

  @observable
  List<Coach>? topCoaches;

  @observable
  List<Coach>? otherCoaches;

  @observable
  String? errorMessage;

  @observable
  String selectedSport = "Cricket";

  @observable
  bool isOpen = false;

  @observable
  int currentPage = 0;

  @action
  Future<void> fetchCoaches() async {
    try {
      isLoading = true;
      errorMessage = null;
      coachDataResponse = await locator<HomeRepoImpl>().coaches();

      if (coachDataResponse!.isOk) {
        topCoaches?.clear();
        filters = coachDataResponse!.data!.filters;
        topCoaches = coachDataResponse!.data!.topCoaches;
        otherCoaches = coachDataResponse!.data!.otherCoaches;
      } else {
        errorMessage = coachDataResponse!.message;
      }
      isLoading = false;
    } on AppException catch (e) {
      errorMessage = e.toString();
    } on DioException catch (e) {
      errorMessage = e.toString();
    } catch (e) {
      errorMessage = e.toString();
    }
  }
}
