import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModelEntity {
  final String productId;
  final String categoryId;
  final String title;
  final String image;
  final String price;
  final String discountPrice;
  final String discription;
  final String shippingReturnDetails;
  final int productType;
  final int salesNumber;
  final List color;
  final List size;
  final Timestamp createdDate;

  ProductModelEntity({
    required this.productId,
    required this.categoryId,
    required this.title,
    required this.image,
    required this.price,
    required this.discountPrice,
    required this.discription,
    required this.shippingReturnDetails,
    required this.productType,
    required this.color,
    required this.size,
    required this.salesNumber,
    required this.createdDate,
  });
}
