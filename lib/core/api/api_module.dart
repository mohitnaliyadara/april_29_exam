import 'package:april_29_exam/core/api/api_end_point.dart';
import 'package:april_29_exam/data/remote/auth.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'interceptor/internet_interceptor.dart';
import 'locator/locator.dart';

class ApiModule {
  Future<void> provides() async {
    final dio = await setup();

    /// register [Dio] in [GetIt]
    locator.registerSingleton(dio);
    //
    // /// register APIs implementations
    locator.registerSingleton(AuthApi(dio));

  }

  static Future<Dio> setup() async {
    final dio = Dio()
      ..options = BaseOptions(
        baseUrl: ApiEndPoint.baseURL,
        validateStatus: (status) {
          if (status == null) true;
          if (status == 401 || status! >= 500) return false;
          return true;
        },
        responseType: ResponseType.json,
      );
    dio.interceptors.add(
      PrettyDioLogger(requestBody: true, responseBody: true),
    );
    dio.interceptors.add(InternetInterceptors());

    return dio;
  }
}
