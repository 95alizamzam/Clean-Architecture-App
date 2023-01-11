import 'package:flutter/material.dart';
import 'package:twekl_test_app/core/colors.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: primaryColor.withOpacity(.3),
      ),
    );
  }
}
