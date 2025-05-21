import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/auth/model/sign_in_model.dart';
import 'package:ecommerce/data/auth/model/user_creation_req.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class UserFirebaseServices {
  Future<Either> signup(UserCreationReqModel userModel);
  Future<Either> getAges();
  Future<Either> signin(UserSigninReqModel userModel);
  Future<Either> sendPasswordResetEmail(String email);
  Future<bool> isLoggedIn();
  Future<Either> getUser();
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

  @override
  Future<Either> getAges() async {
    try {
      var returnedData =
          await FirebaseFirestore.instance.collection('Ages').get();
      return Right(returnedData.docs);
    } on FirebaseException catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either> signin(UserSigninReqModel userModel) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userModel.email ?? '',
        password: userModel.password ?? "",
      );
      return Right("Sign in was Successful");
    } on FirebaseException catch (e) {
      return Left(e.code);
    }
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return Right('Send Successfully');
    } on FirebaseException catch (e) {
      return Left('Please try');
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<Either> getUser() async {
    try {
      var currentUser = FirebaseAuth.instance.currentUser;
      var returnedData = await FirebaseFirestore.instance
          .collection("User")
          .doc(currentUser?.uid)
          .get()
          .then((value) {
            return value.data();
          });
      return Right(returnedData);
    } on FirebaseException catch (e) {
      return Left('Please Try Again');
    }
  }
}
