import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/src/views/widgets/custom_text.dart';
import 'package:travel_app/src/views/widgets/large_text.dart';
import 'package:travel_app/src/views/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final List<String> images = [
    "assets/images/welcome_one.jpg",
    "assets/images/welcome2.jpg",
    "assets/images/welcome_three.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            width: double.maxFinite,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(images[index]),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(top: 15.h, left: 5.w, right: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LargeText(text: "Trips"),
                      CustomText(
                        text: "Mountain",
                        size: 25.sp,
                        color: Colors.black54,
                      ),
                      SizedBox(height: 1.h),
                      SizedBox(
                        width: 39.w,
                        child: CustomText(
                          text:
                              "Mountain hikes gives you an incredible sense of freedom along with endurance test.",
                          size: 15.sp,
                          color: Colors.black38,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<AppCubits>(context).getData();
                        },
                        child: ResponsiveButton(
                          isResponsive: true,
                          width: 20.w,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: List.generate(3, (indexDots) {
                      return Container(
                        width: 1.5.w,
                        height: index == indexDots ? 3.5.h : 1.5.h,
                        margin: EdgeInsets.symmetric(vertical: 4.sp),
                        decoration: BoxDecoration(
                            color: index == indexDots
                                ? const Color(0xFF4a56a8)
                                : const Color(0xFF4a56a8).withOpacity(0.4),
                            borderRadius: BorderRadius.circular(15.sp)),
                      );
                    }),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
