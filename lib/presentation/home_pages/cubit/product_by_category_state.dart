part of 'product_by_category_cubit.dart';

@immutable
sealed class ProductByCategoryState {}

final class ProductByCategoryLoading extends ProductByCategoryState {}

final class ProductByCategoryLoaded extends ProductByCategoryState {
  final List<ProductModelEntity> productList;

  ProductByCategoryLoaded({required this.productList});
}

final class ProductByCategoryFailed extends ProductByCategoryState {
  final String message;

  ProductByCategoryFailed({required this.message});
}
