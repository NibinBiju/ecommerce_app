import 'package:ecommerce/core/config/theme/app_color.dart';
import 'package:ecommerce/domain/product/entities/product_entities.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.productList,
    required this.index,
  });

  final List<ProductModelEntity> productList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(19),
      child: Container(
        width: 200,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(19),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(flex: 5, child: Container(color: Colors.white)),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                width: double.infinity,
                decoration: BoxDecoration(color: AppColors.secondBackground),
                child: Column(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productList[index].title,
                      style: TextStyle(fontSize: 14),
                    ),
                    RichText(
                      text: TextSpan(
                        text:
                            productList[index].discountPrice == ''
                                ? "₹${productList[index].price}"
                                : '',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        children:
                            productList[index].discountPrice == ''
                                ? []
                                : [
                                  TextSpan(
                                    text:
                                        "₹${productList[index].discountPrice}  ",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  TextSpan(
                                    text: "₹${productList[index].price}",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
