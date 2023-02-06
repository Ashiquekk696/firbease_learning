import 'package:equatable/equatable.dart';

abstract class HomeMainEvent extends Equatable {}

class HomeDataEvent extends HomeMainEvent {
  
  HomeDataEvent();
  List<Object?> get props => [];
}
class HomeReloadEvent extends HomeMainEvent {
  
  HomeReloadEvent();
  List<Object?> get props => [];
}
