import 'package:ecommerce/domain/categorys/entity/category_entity_model.dart';

class CategoriesModel {
  final String categoryId;
  final String title;
  final String image;

  CategoriesModel({
    required this.categoryId,
    required this.title,
    required this.image,
  });

  // From JSON
  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      categoryId: json['categoryId'] as String,
      title: json['title'] as String,
      image: json['image'] ?? '',
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {'categoryId': categoryId, 'title': title, 'image': image};
  }
}

extension CategoriesXModel on CategoriesModel {
  CategoriesModelEntity toEntity() {
    return CategoriesModelEntity(
      categoriesId: categoryId,
      title: title,
      image: image,
    );
  }
}
