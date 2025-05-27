import 'package:ecommerce/core/usecases/usecases.dart';
import 'package:ecommerce/domain/product/repository/product_repo.dart';
import 'package:ecommerce/service_locater.dart';
import 'package:dartz/dartz.dart';

class GetNewInProducts extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<ProductRepository>().getNewInSelling();
  }
}
