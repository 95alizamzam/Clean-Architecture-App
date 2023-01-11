import 'package:flutter/material.dart';
import 'package:twekl_test_app/constants/user_constants.dart';
import 'package:twekl_test_app/core/colors.dart';
import 'package:twekl_test_app/core/shared_prefrences.dart';
import 'package:twekl_test_app/core/sl.dart';

import 'core/navigation_services.dart';
import 'features/Auth/presentation/pages/login_page.dart';
import 'features/Home/presentation/pages/home_screen.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    super.initState();

    final String? userToken =
        sl<SharedPrefrencesClass>().readString(key: token);

    Future.delayed(const Duration(seconds: 3), () {
      sl<NavigationServices>().goto(
        context: context,
        nextScreen: userToken != null ? const HomePage() : LoginPage(),
        clean: true,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // color: Color(0xff31b7ec),
          color: primaryColor.withOpacity(.3),
          image: const DecorationImage(
            image: AssetImage('assets/logo/logo_png.png'),
          ),
        ),
      ),
    );
  }
}
