import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:firbease_learning/state/home_state.dart';
import 'package:flutter/material.dart'; 

import '../events/home_events.dart';
import '../models/employees_model.dart';
import '../repositories/list_contacts_repository.dart';
import '../screens/home_screen.dart';

class HomeBloc extends Bloc<HomeMainEvent, HomeMainState> {
  ContactsRepository contactsRepository = ContactsRepository();
  List<EmployeeDataModel>? employeeModel = [];
  int? page = 0;
  static var currentPage;
  static var lastPage;
  HomeBloc({
    required this.contactsRepository,
  }) : super(HomeLoadingState()) {
    on<HomeDataEvent>((event, emit) async {
      emit(HomeLoadingState());

      try {
        page = (page ?? 0) + 1;
        var response = await contactsRepository.getAllContacts(page: page);

        currentPage = response['data']['current_page'];
        lastPage = response['data']['last_page'];
        employeeModel?.add(EmployeeDataModel.fromJson(response['data']));
        emit(HomeLoadedState(employeeModel: employeeModel));
      } catch (e) {
        print(e);
        emit(HomeErrorState(message: e.toString()));
      }
    });

    on<HomeReloadEvent>((event, emit) {});
  }
}
