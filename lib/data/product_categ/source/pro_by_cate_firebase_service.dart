import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class ProductByCategoryFirebaseService {
  Future<Either> getProductsByCategory({required String categoryId});
}

class ProByCateFirebaseServiceImpl extends ProductByCategoryFirebaseService {
  @override
  Future<Either> getProductsByCategory({required String categoryId}) async {
    try {
      var returnedProducts =
          await FirebaseFirestore.instance
              .collection('Products')
              .where('categoryId', isEqualTo: categoryId)
              .get();
      return Right(returnedProducts.docs.map((e) => e.data()));
    } on FirebaseException catch (e) {
      return Left('Something Went Wrong');
    }
  }
}
