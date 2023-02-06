import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart'; 

import '../events/designation_event.dart';
import '../models/designations_model.dart';
import '../repositories/designations_repository.dart';
import '../screens/home_screen.dart';
import '../state/designtaions_state.dart';

class DesignationsBloc extends Bloc<DesignationsMainEvent, DesignationsMainState> {
  DesignationsRepository designationsRepository = DesignationsRepository();
  List<DesignationsModel> designationsData = [];
  DesignationsBloc({required this.designationsRepository}) : super(DesignationsLoadingState()) {
    on<DesignationsDataEvent>((event, emit) async {
      emit(DesignationsLoadingState());

      try {
        var response = await designationsRepository.getAllDesignations();
        print("contct res is $response");
        response['data']['data'].forEach((e) {
          designationsData.add(DesignationsModel.fromJson(e));
        });

        emit(DesignationsLoadedState(designationsModel: designationsData));
      } catch (e) {
        print(e);
        emit(DesignationsErrorState(message: e.toString()));
      }
    });
  }
}
