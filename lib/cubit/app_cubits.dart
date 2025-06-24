import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/services/api/data_services.dart';
import 'package:travel_app/src/models/data_model.dart';

class AppCubits extends Cubit<AppCubitStates> {
  final DataServices dataServices;
  late final List<DataModel> places;

  AppCubits({required this.dataServices}) : super(InitialState()) {
    emit(WelcomeState());
  }

  void getData() async {
    try {
      emit(LoadingState());
      print('Fetching data....');
      places = await dataServices.getInfo();
      emit(LoadedState(places));
      print('Data Fetched....');
     for (var element in places) {
  debugPrint('Place: ${element.name}, Location Name: ${element.location.name}, Location URL: ${element.location.url}, Image: ${element.image}');
}

    } catch (e) {}
  }
  void getPlace(int id) async {
    try {
      emit(LoadingState());
      print('Fetching place with id: $id');
      DataModel place = await dataServices.getInfo().then((places) => places.firstWhere((p) => p.id == id));
      emit(DetailedState(place));
      print('Place Fetched: ${place.name}');
    } catch (e) {
      print('Error fetching place: $e');
    }
  } 
  detailPage(DataModel place) {
    emit(DetailedState(place));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
