import 'package:equatable/equatable.dart';

abstract class LoginMainEvent extends Equatable {}

class LoginPressedEvent extends LoginMainEvent {
  LoginPressedEvent({this.userName, this.password,this.context});
  var userName;
  var password;
  var context;
  List<Object?> get props => [];
}
