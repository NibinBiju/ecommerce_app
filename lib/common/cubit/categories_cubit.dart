import 'package:ecommerce/core/config/assets/app_vectors.dart';
import 'package:ecommerce/domain/categorys/entity/category_entity_model.dart';
import 'package:ecommerce/domain/categorys/usecases/get_categories_usecases.dart';
import 'package:ecommerce/service_locater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesLoading());

  List<String> categoriesImages = [
    AppVectors.shoesImage,
    AppVectors.accessoriesImage,
    AppVectors.hoodiesImage,
    AppVectors.shortsImage,
    AppVectors.bagsImage,
  ];

  void getCategories() async {
    var returnedData = await sl<GetCategoriesUsecases>().call();
    returnedData.fold(
      (error) {
        emit(CategoriesFailed(message: error));
      },
      (data) {
        emit(CategoriesLoaded(returnedData: data));
      },
    );
  }
}
