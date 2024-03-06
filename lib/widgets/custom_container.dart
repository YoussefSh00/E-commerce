import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.text,
    required this.color,
    required this.index,
    required this.colorText,
    required this.width,
    required this.height,
    required this.sizeForText,
  });
  final String text;
  final int index;
  final int width;
  final int height;
  final int sizeForText;

  final Color color;
  final Color colorText;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      alignment: Alignment.center,
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(100.sp)),
      child: Text(
        text,
        style: TextStyle(
            fontSize: sizeForText.sp,
            fontWeight: FontWeight.bold,
            color: colorText),
      ),
    );
  }
}
