import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/auth/model/user_creation_req.dart';
import 'package:ecommerce/domain/auth/repository/auth.dart';

class UserCreationImpl extends AuthRepository {
  @override
  Future<Either> signup(UserCreationReq userModel) {
    throw UnimplementedError();
  }
}