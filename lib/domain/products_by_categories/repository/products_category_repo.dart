import 'package:dartz/dartz.dart';

abstract class ProductsCategoryRepo {
  Future<Either> getProductsByCategory({required String categoryId});
}
