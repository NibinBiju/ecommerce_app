import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/auth/model/user_creation_req.dart';
import 'package:ecommerce/domain/auth/repository/auth.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(UserCreationReqModel userModel) {
    throw UnimplementedError();
  }
}
