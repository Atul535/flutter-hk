import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit_logic.dart';
import 'package:travel_app/cubit/app_cubits.dart';
// import 'package:travel_app/src/views/screens/detail_page.dart';
// import 'package:travel_app/src/views/screens/navpages/main_page.dart';
// import 'package:travel_app/src/views/screens/welcome_page.dart';
import 'package:sizer/sizer.dart';
import 'package:travel_app/services/api/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BlocProvider<AppCubits>(
          create: (context) => AppCubits(
            dataServices: DataServices(),
          ),
          child: const AppCubitLogic(),
        ),
      );
    });
  }
}
