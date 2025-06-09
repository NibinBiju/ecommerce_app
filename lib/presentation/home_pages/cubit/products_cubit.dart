import 'package:ecommerce/core/usecases/usecases.dart';
import 'package:ecommerce/domain/product/entities/product_entities.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final UseCase usecase;
  ProductsCubit({required this.usecase}) : super(ProductsLoading());

  void getProducts() async {
    try {
      var data = await usecase.call();
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
