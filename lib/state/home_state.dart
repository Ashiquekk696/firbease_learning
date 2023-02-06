import 'package:equatable/equatable.dart'; 

import '../models/employees_model.dart';

abstract class HomeMainState extends Equatable {}

class HomeLoadingState extends HomeMainState {
  List<Object?> get props => [];
}

class HomeLoadedState extends HomeMainState {
  HomeLoadedState({this.employeeModel});
//  List<EmployeeSubDataModel>? employeeSubDataModel=[];
  List<EmployeeDataModel>? employeeModel=[];
  List<Object?> get props => [employeeModel];
}

class HomeErrorState extends HomeMainState {
  HomeErrorState({this.message});
  var message;
  List<Object?> get props => [message];
}
