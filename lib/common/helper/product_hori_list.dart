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
          return productList[index].productType == 1
              ? Container(
                width: 200,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
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
                            topLeft: Radius.circular(23),
                            topRight: Radius.circular(23),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ListTile(title: Text(productList[index].title)),
                    ),
                  ],
                ),
              )
              : Container();
        },
        separatorBuilder: (context, index) => SizedBox(width: 20),
        itemCount: productList.length,
      ),
    );
  }
}
