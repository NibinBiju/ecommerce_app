import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/usecases/usecases.dart';
import 'package:ecommerce/domain/auth/repository/auth.dart';
import 'package:ecommerce/service_locater.dart';

class GetUserUsecases implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<AuthRepository>().getUser();
  }
}
