import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/usecases/usecases.dart';
import 'package:ecommerce/domain/product/repository/product_repo.dart';
import 'package:ecommerce/service_locater.dart';

class GetproductsUsecases extends UseCase<Either,dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<ProductRepository>().getTopSelling();
  }
}
