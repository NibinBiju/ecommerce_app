import 'package:ecommerce/domain/categorys/entity/category_entity_model.dart';

class CategoriesModel {
  final String categoriesId;
  final String title;
  final String image;

  CategoriesModel({
    required this.categoriesId,
    required this.title,
    required this.image,
  });

  // From JSON
  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      categoriesId: json['categoriesId'] as String,
      title: json['title'] as String,
      image: json['image'] ?? '',
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {'categoriesId': categoriesId, 'title': title, 'image': image};
  }
}

extension CategoriesXModel on CategoriesModel {
  CategoriesModelEntity toEntity() {
    return CategoriesModelEntity(
      categoriesId: categoriesId,
      title: title,
      image: image,
    );
  }
}
