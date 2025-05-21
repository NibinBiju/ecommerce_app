import 'package:ecommerce/domain/auth/usecases/get_user.dart';
import 'package:ecommerce/domain/auth/entity/user_model_entity.dart';
import 'package:ecommerce/service_locater.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_info_display_state.dart';

class UserInfoDisplayCubit extends Cubit<UserInfoDisplayState> {
  UserInfoDisplayCubit() : super(UserInfoDisplayLoading());

  void getUser() async {
    var returedData = await sl<GetUserUsecases>().call();
    returedData.fold(
      (error) {
        emit(UserInfoDisplayFailed(message: error.toString()));
      },
      (data) {
        emit(UserInfoDisplayLoaded(
          userModelEntity: data,
        ));
      },
    );
  }
}
