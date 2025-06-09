import 'package:ecommerce/common/helper/product_card/product_card.dart';
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
          return ProductCard(productList: productList, index: index);
        },
        separatorBuilder: (context, index) => SizedBox(width: 20),
        itemCount: productList.length,
      ),
    );
  }
}
