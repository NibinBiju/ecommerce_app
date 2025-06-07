import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/product_categ/source/pro_by_cate_firebase_service.dart';
import 'package:ecommerce/data/products/model/product_model.dart';
import 'package:ecommerce/domain/products_by_categories/repository/products_category_repo.dart';
import 'package:ecommerce/service_locater.dart';

class ProductCateRepoImpl extends ProductsCategoryRepo {
  @override
  Future<Either> getProductsByCategory({required String categoryId}) async {
    var data = await sl<ProductByCategoryFirebaseService>()
        .getProductsByCategory(categoryId: categoryId);
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
