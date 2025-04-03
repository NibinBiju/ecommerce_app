import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/auth/model/user_creation_req.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class UserFirebaseServices {
  Future<Either> signup(UserCreationReqModel userModel);
}

class UserFirebaseServicesImple extends UserFirebaseServices {
  @override
  Future<Either> signup(UserCreationReqModel userModel) async {
    try {
      var returnedData = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: userModel.email ?? '',
            password: userModel.password ?? "",
          );

      await FirebaseFirestore.instance
          .collection('User')
          .doc(returnedData.user?.uid)
          .set({
            'firstName': userModel.firstName,
            'lastName': userModel.lastName,
            'email': userModel.email,
            'password': userModel.password,
            'gender': userModel.gender,
            'age': userModel.age,
          });

      return Right('Sign up was Successful');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'weak-password') {
        message = 'The password provided is weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exist in same email';
      }
      return Left(message);
    }
  }
}
