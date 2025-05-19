import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/usecases/usecases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'button_state.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonStateInitial());

  Future<void> execute({dynamic params, required UseCase usecase}) async {
    emit(ButtonStateLoading());
    try {
      Either returnedData = await usecase.call(params: params);
      returnedData.fold(
        (error) {
          emit(ButtonStateFailed(message: error.toString()));
        },
        (success) {
          emit(ButtonStateSuccess());
        },
      );
    } catch (e) {
      emit(ButtonStateFailed(message: e.toString()));
    }
  }
}
