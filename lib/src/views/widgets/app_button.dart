import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:travel_app/src/views/widgets/custom_text.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final double size;
  final String? text;
  final IconData? icon;
  final Color borderColor;
  final bool? isIcon;
  const AppButton(
      {super.key,
      this.text = 'Hi',
      this.icon,
      required this.color,
      required this.backgroundColor,
      required this.borderColor,
      required this.size,
      this.isIcon = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.sp),
        color: backgroundColor,
        border: Border.all(color: borderColor, width: 2.sp),
      ),
      child: isIcon == false
          ? Center(
              child: CustomText(
              text: text!,
              color: color,
            ))
          : Center(
              child: Icon(
              icon!,
              color: color,
            )),
    );
  }
}
