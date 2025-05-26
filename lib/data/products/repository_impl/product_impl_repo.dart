import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/products/model/product_model.dart';
import 'package:ecommerce/data/products/source/products_firebase_services.dart';
import 'package:ecommerce/domain/product/repository/product_repo.dart';
import 'package:ecommerce/service_locater.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<Either> getTopSelling() async {
    var data = await sl<ProductsFirebaseServices>().getTopSelling();
    return data.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(
            data,
          ).map((e) => ProductModel.fromJson(e).toEntity()).toList(),
        );
      },
    );
  }
}
