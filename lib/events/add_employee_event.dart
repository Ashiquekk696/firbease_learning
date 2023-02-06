import 'package:equatable/equatable.dart';

abstract class AddEmployeeMainEvent extends Equatable {}

class AddEmployeePressedEvent extends AddEmployeeMainEvent {
  AddEmployeePressedEvent(
      {this.firstName,
      this.landLine,
      this.lastName,
      this.jointDate,
      this.dob,
      this.gender,
      this.email,
      this.mobile,
      this.presentAddres,this.context,
      this.profilePicture,
      this.resume,
      this.designationId});
  var firstName;
  var lastName;
  var jointDate;
  var dob;
  var designationId;
  var gender;
  var email;
  var mobile;
  var landLine;
  var presentAddres;
  var profilePicture;
  var resume;
  var context;
  List<Object?> get props => [];
}
