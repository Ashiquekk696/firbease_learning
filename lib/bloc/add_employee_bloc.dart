import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../events/add_employee_event.dart';
import '../helpers/shared_preferences.dart';
import '../repositories/add_employee_repository.dart';
import '../repositories/list_contacts_repository.dart';
import '../screens/home_screen.dart';
import '../state/add_employee_state.dart';

class AddEmployeeBloc extends Bloc<AddEmployeeMainEvent, AddEmployeeMainState> {
  AddEmployeeReposiotry addEmployeeReposiotry = AddEmployeeReposiotry();
  AddEmployeeBloc({required this.addEmployeeReposiotry})
      : super(AddEmployeeInitialState()) {
    on<AddEmployeePressedEvent>((event, emit) async {
      emit(AddEmployeeLoadingState());

      try {
        Preferences preferences = await Preferences();
        var response = await addEmployeeReposiotry.addEmployeeREpository(
            email: event.email,
            dateOfBirth: event.dob,
            designationId: event.designationId,
            firstName: event.firstName,
            lastName: event.lastName,
            gender: event.gender,
            mobile: event.mobile,
            resume: event.resume,
            profilePicture: event.profilePicture,
            presentAddress: event.presentAddres);
        print("adddata${response['message']}");

        print("adddata${response}");
        if (response["message"] == "Employee has been saved") {
          Navigator.pushReplacement(
              event.context,
              MaterialPageRoute(
                  builder: (context) => RepositoryProvider(
                      create: (context) => ContactsRepository(),
                      child: HomeScreen())));
        }
        emit(AddEmployeeLoadedState(mesage: response['message']));
      } catch (e) {
        print(e);
        emit(AddEmployeeErrorState(message: e.toString()));
      }
    });
  }
}
