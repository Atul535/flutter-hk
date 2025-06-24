import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ResponsiveButton extends StatelessWidget {
  final bool? isResponsive;
  final double? width;
  final double? height;
  final String? text;
  const ResponsiveButton({
    super.key,
    this.isResponsive = false,
    this.width,
    this.height,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: width,
        height: height ?? 5.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),
            color: const Color(0xFF94A1D3)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text ?? '',
              style: TextStyle(color: Colors.white, fontSize: 17.sp),
            ),
            // SizedBox(width: width ?? 10.w),
            Image.asset('assets/images/arrow_logo.jpeg'),
          ],
        ),
      ),
    );
  }
}
