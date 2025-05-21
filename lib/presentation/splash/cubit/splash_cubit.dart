import 'package:ecommerce/domain/auth/usecases/is_loggedin_usecases.dart';
import 'package:ecommerce/service_locater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void appStarted() async {
    await Future.delayed(Duration(seconds: 3));
    bool isloggedin = await sl<IsLoggedinUsecase>().call();
    if (isloggedin == true) {
      emit(AuthenticatedSplash());
    } else {
      emit(UnAuthenticatedSplash());
    }
  }
}
