import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/usecases/usecases.dart';
import 'package:ecommerce/data/auth/model/sign_in_model.dart';
import 'package:ecommerce/domain/auth/repository/auth.dart';
import 'package:ecommerce/service_locater.dart';

class SigninUsecases implements UseCase<Either, UserSigninReqModel> {
  @override
  Future<Either> call({UserSigninReqModel? params}) async {
    return await sl<AuthRepository>().signin(params!);
  }
}
