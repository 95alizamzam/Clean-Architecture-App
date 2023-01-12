import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSizedText extends StatelessWidget {
  const CustomSizedText({
    super.key,
    required this.text,
    this.maxLine = 1,
    required this.style,
    this.align,
  });
  final String text;
  final int maxLine;
  final TextStyle style;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxLines: maxLine,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      minFontSize: 12.sp,
      style: style,
      stepGranularity: 12.sp,
      textAlign: align,
    );
  }
}
