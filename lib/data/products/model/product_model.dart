import 'package:ecommerce/domain/product/entities/product_entities.dart';

class ProductModel {
  final String productId;
  final String title;
  final String image;
  final String price;
  final String discountPrice;
  final String discription;
  final String shippingReturnDetails;
  final int productType;
  final List color;
  final List size;

  ProductModel({
    required this.productId,
    required this.title,
    required this.image,
    required this.price,
    required this.discountPrice,
    required this.discription,
    required this.shippingReturnDetails,
    required this.productType,
    required this.color,
    required this.size,
  });

  // From JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productId: json['productId'] as String,
      title: json['title'] as String,
      image: json['image'] ?? '',
      price: json['price'] as String,
      discountPrice: json['discountPrice'] as String,
      discription: json['discription'] as String,
      shippingReturnDetails: json['shippingReturnDetails'] as String,
      productType: json['productType'] as int,
      color: json['color'] as List,
      size: json['size'] as List,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'image': image,
      'price': price,
      'discountPrice': discountPrice,
      'discription': discription,
      'shippingReturnDetails': shippingReturnDetails,
      'productType': productType,
      'size': size,
      'color': color,
    };
  }
}

extension ProductXModel on ProductModel {
  ProductModelEntity toEntity() {
    return ProductModelEntity(
      productId: productId,
      title: title,
      image: image,
      price: price,
      discountPrice: discountPrice,
      discription: discription,
      shippingReturnDetails: shippingReturnDetails,
      productType: productType,
      color: color,
      size: size,
    );
  }
}
