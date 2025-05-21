import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/auth/model/sign_in_model.dart';
import 'package:ecommerce/data/auth/model/user_creation_req.dart';

abstract class AuthRepository {
  Future<Either> signup(UserCreationReqModel userModel);
  Future<Either> getAges();
  Future<Either> signin(UserSigninReqModel userModel);
  Future<Either> sendPasswordResetEmail(String email);
  Future<bool> isLoggedIn();
  Future<Either> getUser();
}
