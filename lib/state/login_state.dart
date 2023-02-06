import 'package:equatable/equatable.dart';

abstract class LoginMainState extends Equatable {}

class LoginInitialState extends LoginMainState {
  List<Object?> get props => [];
}

class LoginLoadingState extends LoginMainState {
   List<Object?> get props => [];
}

class LoginLoadedState extends LoginMainState {var mesage;
  LoginLoadedState({this.mesage});
  List<Object?> get props => [mesage];
 
}

class LoginErrorState extends LoginMainState {
  LoginErrorState({this.message});
  var message;
  List<Object?> get props => [message];
}
