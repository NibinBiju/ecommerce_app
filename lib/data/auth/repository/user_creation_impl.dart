import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/auth/model/sign_in_model.dart';
import 'package:ecommerce/data/auth/model/user_creation_req.dart';
import 'package:ecommerce/data/auth/model/user_model.dart';
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

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    return await sl<UserFirebaseServices>().sendPasswordResetEmail(email);
  }

  @override
  Future<bool> isLoggedIn() async {
    return await sl<UserFirebaseServices>().isLoggedIn();
  }

  @override
  Future<Either> getUser() async {
    var userData = await sl<UserFirebaseServices>().getUser();
    return userData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(UserModel.fromJson(data).toEntity());
      },
    );
  }
}
