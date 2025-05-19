import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/auth/model/sign_in_model.dart';
import 'package:ecommerce/data/auth/model/user_creation_req.dart';
import 'package:ecommerce/data/auth/source/user_firebase_services.dart';
import 'package:ecommerce/domain/auth/repository/auth.dart';
import 'package:ecommerce/service_locater.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(UserCreationReqModel userModel) async {
    return await sl<UserFirebaseServices>().signup(userModel);
  }

  @override
  Future<Either> getAges() async {
    return await sl<UserFirebaseServices>().getAges();
  }

  @override
  Future<Either> signin(UserSigninReqModel userModel) async {
    return await sl<UserFirebaseServices>().signin(userModel);
  }
}
