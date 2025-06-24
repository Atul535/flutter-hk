import 'package:equatable/equatable.dart';
import 'package:travel_app/src/models/data_model.dart';

abstract class AppCubitStates extends Equatable {}

class InitialState extends AppCubitStates {
  @override
  List<Object?> get props => [];
}

class WelcomeState extends AppCubitStates {
  @override
  List<Object?> get props => [];
}

class LoadingState extends AppCubitStates {
  @override
  List<Object?> get props => [];
}

class LoadedState extends AppCubitStates {
  final List<DataModel> places;
  LoadedState(this.places);
  @override
  List<Object?> get props => [places];
}

class DetailedState extends AppCubitStates {
  final DataModel place;
  DetailedState(this.place);

  @override
  List<Object> get props => [place];
}
