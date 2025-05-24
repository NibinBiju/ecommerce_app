import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/usecases/usecases.dart';
import 'package:ecommerce/domain/categorys/repository/category_repo.dart';
import 'package:ecommerce/service_locater.dart';

class GetCategoriesUsecases extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<CategoryRepository>().getCategories();
  }
}
