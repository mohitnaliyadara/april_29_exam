import 'package:april_29_exam/core/api/locator/locator.dart';
import 'package:april_29_exam/ui/auth/signin/view/sign_in_screen.dart';
import 'package:april_29_exam/ui/auth/signup/view/sign_up_screen.dart';
import 'package:april_29_exam/values/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobx/mobx.dart';

//scaffoldMessengerKey

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpLocator();
  GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: Size(390, 974),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        scaffoldMessengerKey: snackbarKey,
        theme: appTheme,
        home: SignInScreen(),
      ),
    );
  }
}
