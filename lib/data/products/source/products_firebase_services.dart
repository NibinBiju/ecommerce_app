import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class ProductsFirebaseServices {
  Future<Either> getTopSelling();
}

class ProductsFirebaseServicesImpl implements ProductsFirebaseServices {
  @override
  Future<Either> getTopSelling() async {
    try {
      var returnedProducts =
          await FirebaseFirestore.instance.collection('Products').get();
      return Right(returnedProducts.docs.map((e) => e.data()));
    } on FirebaseException catch (e) {
      return Left('Something Went Wrong');
    }
  }
}
