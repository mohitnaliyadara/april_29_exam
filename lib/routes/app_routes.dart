
import 'package:april_29_exam/ui/auth/signin/view/sign_in_screen.dart';
import 'package:april_29_exam/ui/home/coach_profile/view/coach_profile_screen.dart';
import 'package:april_29_exam/ui/home/home/view/home_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../core/api/locator/locator.dart';
import '../ui/auth/signup/view/sign_up_screen.dart';
part 'app_routes.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)

class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
AutoRoute(page: SignInScreenRoute.page,initial: true),
    AutoRoute(page:SignUpScreenRoute.page,),
AutoRoute(page: HomeScreenRoute.page),
    AutoRoute(page: CoachProfileScreenRoute.page)
  ];
}

final appRouter = locator<AppRouter>();