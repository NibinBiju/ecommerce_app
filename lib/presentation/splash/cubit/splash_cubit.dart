import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void appStarted() async {
    await Future.delayed(Duration(seconds: 3));
    emit(UnAuthenticatedSplash());
  }
}
