import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryFirebaseServices {
  Future<Either> getCategories();
}

class CategoryFirebaseServicesImpl extends CategoryFirebaseServices {
  @override
  Future<Either> getCategories() async {
    try {
      var returedData =
          await FirebaseFirestore.instance.collection('Categories').get();
      return Right(returedData.docs.map((e) => e.data()));
    } on FirebaseException catch (e) {
      return Left('Error while fetching categories');
    }
  }
}
