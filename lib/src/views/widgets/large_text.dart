import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LargeText extends StatelessWidget {
  final double? size;
  final String text;
  final Color color;
  const LargeText(
      {super.key, required this.text, this.color = Colors.black, this.size});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          color: color,
          fontSize: size ?? 25.sp,
          fontWeight: FontWeight.bold,
        ));
  }
}
