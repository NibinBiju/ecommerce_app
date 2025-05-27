part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsLoaded extends ProductsState {
  final List<ProductModelEntity> productModelEntity;

  ProductsLoaded({required this.productModelEntity});
}

final class ProductsFailed extends ProductsState {
  final String message;

  ProductsFailed({required this.message});
}
