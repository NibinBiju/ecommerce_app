import 'package:dartz/dartz.dart';

abstract class CategoryFirebaseServices {
  Future<Either> getCategories();
}

class CategoryFirebaseServicesImpl extends CategoryFirebaseServices{
  @override
  Future<Either> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }
  
}