import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/usecases/usecases.dart';
import 'package:ecommerce/data/auth/repository/user_creation_impl.dart';
import 'package:ecommerce/service_locater.dart';

class GetAgesUsecases implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<AuthRepositoryImpl>().getAges();
  }
}
