import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class ProductsFirebaseServices {
  Future<Either> getTopSelling();
  Future<Either> getNewInSelling();
}

class ProductsFirebaseServicesImpl implements ProductsFirebaseServices {
  @override
  Future<Either> getTopSelling() async {
    try {
      var returnedProducts =
          await FirebaseFirestore.instance
              .collection('Products')
              .where('salesNumber', isGreaterThanOrEqualTo: 20)
              .get();
      return Right(returnedProducts.docs.map((e) => e.data()));
    } on FirebaseException catch (e) {
      return Left('Something Went Wrong');
    }
  }

  @override
  Future<Either> getNewInSelling() async {
    try {
      var returnedProducts =
          await FirebaseFirestore.instance
              .collection('Products')
              .where(
                'createdDate',
                isGreaterThanOrEqualTo: Timestamp.fromDate(
                  DateTime(2025, 5, 17),
                ),
              )
              .get();
      return Right(returnedProducts.docs.map((e) => e.data()));
    } on FirebaseException catch (e) {
      return Left('Something Went Wrong');
    }
  }
}
