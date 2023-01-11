import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twekl_test_app/shared/components/btns.dart';
import 'package:twekl_test_app/shared/components/sized_box.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.error,
    required this.onTap,
  });
  final String error;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            error,
            style: TextStyle(fontSize: 18.sp),
          ),
          const Vspace(height: 14),
          CustomElevatedBtn(
            onTap: onTap,
            label: 'Retry',
            bgColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
