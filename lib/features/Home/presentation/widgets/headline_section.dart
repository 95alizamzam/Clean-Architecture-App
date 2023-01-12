import 'package:flutter/material.dart';
import 'package:twekl_test_app/core/colors.dart';

import '../../../../shared/components/auto_sized_text.dart';

class CustomHeadline extends StatelessWidget {
  const CustomHeadline({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: primaryColor.withOpacity(.2),
      ),
      child: CustomSizedText(
        text: text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}
