import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/usecases/usecases.dart';
import 'package:ecommerce/data/auth/model/user_creation_req.dart';
import 'package:ecommerce/domain/auth/repository/auth.dart';
import 'package:ecommerce/service_locater.dart';

class SignupUsecases implements UseCase<Either, UserCreationReqModel> {
  @override
  Future<Either> call({UserCreationReqModel? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }
}
