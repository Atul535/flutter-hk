import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/src/views/widgets/app_button.dart';
import 'package:travel_app/src/views/widgets/custom_text.dart';
import 'package:travel_app/src/views/widgets/large_text.dart';
import 'package:travel_app/src/views/widgets/responsive_button.dart';
// import 'package:travel_app/src/views/screens/home_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStar = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, AppCubitStates>(
      builder: (context, state) {
        DetailedState detailedState = state as DetailedState;
        // var place = detailState.place;
        return Scaffold(
          body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  left: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 45.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        // image: AssetImage('assets/images/mountain.jpg'),
                        image: NetworkImage(detailedState.place.image),
                        fit: BoxFit.cover,
                      ),
                      // borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Positioned(
                  top: 5.h,
                  left: 2.w,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).goHome();
                        },
                        icon: const Icon(Icons.menu),
                        color: Colors.white,
                      ),
                      // IconButton(
                      //     onPressed: () {}, icon: const Icon(Icons.more_vert)),
                    ],
                  ),
                ),
                Positioned(
                  top: 40.h,
                  child: Container(
                    height: 60.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.sp),
                        topRight: Radius.circular(25.sp),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 4.w, right: 4.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                LargeText(
                                  text: detailedState.place.name,
                                  size: 22.sp,
                                  color: Colors.black.withOpacity(0.8),
                                ),
                                LargeText(
                                  text: "\$ 250",
                                  size: 20.sp,
                                  color: const Color(0xFF4a56a8),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on,
                                  color: const Color(0xFF4a56a8), size: 20.sp),
                              SizedBox(width: 1.w),
                              CustomText(
                                text: detailedState.place.location.name,
                                color: const Color(0xFF4a56a8),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Row(
                            children: [
                              Wrap(
                                children: List.generate(5, (index) {
                                  return Icon(
                                    Icons.star,
                                    color: index < gottenStar
                                        ? Colors.yellow
                                        : Colors.grey,
                                  );
                                }),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              CustomText(
                                text: "(4.0)",
                                color: Colors.grey,
                                size: 18.sp,
                              )
                            ],
                          ),
                          SizedBox(height: 2.h),
                          LargeText(
                              text: "People",
                              size: 18.sp,
                              color: Colors.black.withOpacity(0.8)),
                          SizedBox(
                            height: 1.sp,
                          ),
                          const CustomText(
                            text: 'Number of people in you group',
                            color: Colors.grey,
                          ),
                          SizedBox(height: 1.h),
                          Wrap(
                            children: List.generate(5, (index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 2.w),
                                  child: AppButton(
                                    size: 28.sp,
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                    backgroundColor: selectedIndex == index
                                        ? Colors.black
                                        : Colors.grey.shade300,
                                    borderColor: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black.withOpacity(0.2),
                                    text: (index + 1).toString(),
                                  ),
                                ),
                              );
                            }),
                          ),
                          SizedBox(height: 3.h),
                          LargeText(
                            text: 'Description',
                            size: 19.sp,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          CustomText(
                            text:
                                'Yosemite National Park is located in central Sierra Nevada in the US state of California. It is located near the wild protected areas.',
                            color: Colors.grey.shade600,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 2.h,
                  left: 4.w,
                  right: 4.w,
                  child: Row(
                    children: [
                      AppButton(
                        color: const Color(0xFF4a56a8),
                        backgroundColor: Colors.grey.shade100,
                        borderColor: Colors.blueGrey,
                        isIcon: true,
                        icon: Icons.favorite_border,
                        size: 29.sp,
                      ),
                      SizedBox(width: 3.w),
                      ResponsiveButton(
                        isResponsive: true,
                        text: 'Book Trip Now',
                        // width: 77.w,
                        height: 6.5.h,
                        // width: 15.w, // Adjusted for responsiveness
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
