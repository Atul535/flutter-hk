import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/src/views/widgets/custom_text.dart';
import 'package:travel_app/src/views/widgets/large_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List tab = ["Places", "Inspiration", "Emotions"];
  var images = {
    "assets/images/balloning.jpg": "Balloning",
    "assets/images/hiking.jpg": 'Hiking',
    "assets/images/gliding.jpg": 'Gliding',
    "assets/images/bungee.jpg": "Bungee",
    "assets/images/kayaking.jpg": "Kayaking",
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubits, AppCubitStates>(
        builder: (context, state) {
          if (state is LoadedState) {
            var info = state.places;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 6.h),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.menu,
                          size: 25.sp,
                          color: Colors.black54,
                        ),
                        Container(
                          width: 10.w,
                          height: 5.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.sp),
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: LargeText(
                    text: "Discover",
                    size: 22.sp,
                  ),
                ),
                SizedBox(height: 2.h),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      tabAlignment: TabAlignment.start,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicatorSize: TabBarIndicatorSize.label,
                      isScrollable: true,
                      controller: _tabController,
                      dividerColor: Colors.transparent,
                      tabs: [
                        Tab(
                          text: tab[0],
                        ),
                        Tab(
                          text: tab[1],
                        ),
                        Tab(
                          text: tab[2],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 4.w),
                  width: double.maxFinite,
                  height: 40.h,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                        itemCount: info.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              BlocProvider.of<AppCubits>(context)
                                  .detailPage(info[index]);
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 4.w, top: 2.h),
                              width: 50.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.sp),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage(info[index].image),
                                  // image: AssetImage("assets/images/mountain${index + 1}.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 3.h),
                Container(
                  margin: EdgeInsets.only(left: 4.w, right: 4.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LargeText(text: "Explore more", size: 18.sp),
                      const CustomText(text: "See All", color: Colors.grey),
                    ],
                  ),
                ),
                SizedBox(height: 1.5.h),
                Container(
                  height: 12.h,
                  width: double.maxFinite,
                  margin: EdgeInsets.only(left: 4.w),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              right: 10.w,
                            ),
                            width: 16.w,
                            height: 8.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.sp),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(images.keys.elementAt(index)),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 1.5.h),
                          Container(
                            margin: EdgeInsets.only(
                              right: 10.w,
                            ),
                            child: CustomText(
                              text: images.values.elementAt(index),
                              color: Colors.black,
                              size: 15.sp,
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
