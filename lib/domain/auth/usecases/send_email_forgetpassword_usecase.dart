import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/usecases/usecases.dart';
import 'package:ecommerce/domain/auth/repository/auth.dart';
import 'package:ecommerce/service_locater.dart';

class SendEmailForgetPasswordUsecase extends UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<AuthRepository>().sendPasswordResetEmail(params!);
  }
}
