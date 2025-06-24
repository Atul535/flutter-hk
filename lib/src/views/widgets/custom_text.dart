import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomText extends StatelessWidget {
  final double? size;
  final String? text;
  final Color color;
  const CustomText({
    super.key,
    this.text,
    this.color = Colors.black,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text!,
        style: TextStyle(
          color: color,
          fontSize: size ?? 16.sp,
        ));
  }
}
