import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/src/views/screens/detail_page.dart';
import 'package:travel_app/src/views/screens/home_page.dart';
import 'package:travel_app/src/views/screens/welcome_page.dart';

class AppCubitLogic extends StatefulWidget {
  const AppCubitLogic({super.key});

  @override
  _AppCubitLogicState createState() => _AppCubitLogicState();
}

class _AppCubitLogicState extends State<AppCubitLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, AppCubitStates>(builder: (context, state) {
        if (state is WelcomeState) {
          return WelcomePage();
        } else if (state is LoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is LoadedState) {
          return HomePage();
        } else if (state is DetailedState) {
          return DetailPage();
        } else {
          return Center(child: Text('Unknown State'));
        }
      }),
    );
  }
}
