import 'package:ecommerce/core/config/theme/app_color.dart';
import 'package:ecommerce/domain/product/entities/product_entities.dart';
import 'package:flutter/material.dart';

class ProductHorizontalListWidget extends StatelessWidget {
  const ProductHorizontalListWidget({super.key, required this.productList});
  final List<ProductModelEntity> productList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 200,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: AppColors.secondBackground,
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(17),
                        topRight: Radius.circular(17),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                            "₹${productList[index].discountPrice} ",
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
                                          decoration:
                                              TextDecoration.lineThrough,
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
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 20),
        itemCount: productList.length,
      ),
    );
  }
}
