class ProductModelEntity {
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

  ProductModelEntity({
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
}
