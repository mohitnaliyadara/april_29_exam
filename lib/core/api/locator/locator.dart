import 'package:april_29_exam/core/api/api_module.dart';
import 'package:april_29_exam/data/remote/home.dart';
import 'package:april_29_exam/data/repo_impl/auth_repo_impl.dart';
import 'package:april_29_exam/data/repo_impl/home_repo_impl.dart';
import 'package:april_29_exam/routes/app_routes.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {
  await ApiModule().provides();

  /// auth repository impl
  locator.registerLazySingleton(() => AuthRepoImpl(authApi: locator()));

  /// Home api and Home repo impl
  locator.registerSingleton<HomeApi>(HomeApi(locator()));
  locator.registerLazySingleton(() => HomeRepoImpl(homeApi: locator()));
  locator.registerSingleton<AppRouter>(AppRouter());
}
