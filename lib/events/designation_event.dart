import 'package:equatable/equatable.dart';

abstract class DesignationsMainEvent extends Equatable {}

class DesignationsDataEvent extends DesignationsMainEvent {
  var page;
  DesignationsDataEvent({this.page});
  List<Object?> get props => [page];
}
