import 'package:ecommerce/domain/product/entities/product_entities.dart';
import 'package:ecommerce/domain/product/usecases/getproducts_usecases.dart';
import 'package:ecommerce/service_locater.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsLoading());

  void getProducts() async {
    try {
      var data = await sl<GetproductsUsecases>().call();
      data.fold(
        (error) {
          emit(ProductsFailed(message: error));
        },
        (data) {
          emit(ProductsLoaded(productModelEntity: data));
        },
      );
    } catch (e) {
      emit(ProductsFailed(message: e.toString()));
    }
  }
}
