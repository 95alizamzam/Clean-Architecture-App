import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedBtn extends StatelessWidget {
  const CustomElevatedBtn({
    super.key,
    required this.onTap,
    required this.label,
    required this.bgColor,
    this.elevation = 4,
    this.width = 150,
    this.height = 30,
    this.radius = 5,
  });
  final VoidCallback onTap;
  final String label;
  final Color bgColor;
  final double elevation, width, height, radius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(bgColor),
        alignment: Alignment.center,
        elevation: MaterialStateProperty.all(elevation.h),
        fixedSize: MaterialStateProperty.all(Size(width.w, height.h)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius.r)),
        ),
      ),
      child: Text(label),
    );
  }
}
