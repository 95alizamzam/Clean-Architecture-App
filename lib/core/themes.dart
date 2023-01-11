import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twekl_test_app/core/colors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    elevation: 2,
    backgroundColor: primaryColor.withOpacity(.3),
    centerTitle: true,
    titleSpacing: 0,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      color: textColor,
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      color: textColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
    ),
    bodySmall: TextStyle(
      color: textColor,
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
    ),
  ),
);
