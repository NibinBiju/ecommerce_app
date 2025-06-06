part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesLoaded extends CategoriesState {
  final List<CategoriesModelEntity> returnedData;
  final List<String> categoriesImages = [
    'assets/vectors/Ellipse 1.svg',
    AppVectors.accessoriesImage,
    AppVectors.hoodiesImage,
    AppVectors.shortsImage,
    AppVectors.bagsImage,
    AppVectors.bagsImage,
  ];
  CategoriesLoaded({required this.returnedData});
}

final class CategoriesFailed extends CategoriesState {
  final String message;

  CategoriesFailed({required this.message});
}
