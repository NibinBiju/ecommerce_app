import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/usecases/usecases.dart';
import 'package:ecommerce/domain/products_by_categories/repository/products_category_repo.dart';
import 'package:ecommerce/service_locater.dart';

class ProductsCategUsecase implements UseCase<Either,dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<ProductsCategoryRepo>().getProductsByCategory(
      categoryId: params,
    );
  }
}
