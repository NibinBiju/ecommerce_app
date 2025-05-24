part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesLoaded extends CategoriesState {
  final List<CategoriesModelEntity> returnedData;

  CategoriesLoaded({required this.returnedData});

}

final class CategoriesFailed extends CategoriesState {
  final String message;

  CategoriesFailed({required this.message});
}
