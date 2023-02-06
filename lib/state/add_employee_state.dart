import 'package:equatable/equatable.dart';

abstract class AddEmployeeMainState extends Equatable {}

class AddEmployeeInitialState extends AddEmployeeMainState {
  List<Object?> get props => [];
}

class AddEmployeeLoadingState extends AddEmployeeMainState {
   List<Object?> get props => [];
}

class AddEmployeeLoadedState extends AddEmployeeMainState {var mesage;
  AddEmployeeLoadedState({this.mesage});
  List<Object?> get props => [mesage];
 
}

class AddEmployeeErrorState extends AddEmployeeMainState {
  AddEmployeeErrorState({this.message});
  var message;
  List<Object?> get props => [message];
}
