import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/category_data/model/categories_model.dart';
import 'package:ecommerce/data/category_data/source/category_firebase_services.dart';
import 'package:ecommerce/domain/categorys/repository/category_repo.dart';
import 'package:ecommerce/service_locater.dart';

class CategoryRepoImpl extends CategoryRepository {
  @override
  Future<Either> getCategories() async {
    var returnedData = await sl<CategoryFirebaseServices>().getCategories();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(CategoriesModel.fromJson(data).toEntity());
      },
    );
  }
}
