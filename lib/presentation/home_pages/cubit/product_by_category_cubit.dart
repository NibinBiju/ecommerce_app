import 'package:ecommerce/domain/product/entities/product_entities.dart';
import 'package:ecommerce/domain/products_by_categories/usecases/products_categ_usecase.dart';
import 'package:ecommerce/service_locater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_by_category_state.dart';

class ProductByCategoryCubit extends Cubit<ProductByCategoryState> {
  ProductByCategoryCubit() : super(ProductByCategoryLoading());

  void onCategoryByProductLoad({required String categoryId}) async {
    var returnedData = await sl<ProductsCategUsecase>().call(
      params: categoryId,
    );

    returnedData.fold(
      (error) {
        emit(ProductByCategoryFailed(message: error));
      },
      (data) {
        emit(ProductByCategoryLoaded(productList: data));
      },
    );
  }
}
