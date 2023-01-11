import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twekl_test_app/core/network.dart';
import 'package:twekl_test_app/core/shared_prefrences.dart';
import 'package:twekl_test_app/core/sl.dart';
import 'package:twekl_test_app/core/strings.dart';
import 'package:twekl_test_app/core/themes.dart';
import 'package:twekl_test_app/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupSl();
  await sl<SharedPrefrencesClass>().init();
  sl<DioClass>().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      builder: (context, child) => MaterialApp(
        title: appName,
        theme: lightTheme,
        home: const SplachScreen(),
      ),
    );
  }
}
