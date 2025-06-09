import 'package:ecommerce/common/helper/product_card/product_card.dart';
import 'package:ecommerce/domain/product/entities/product_entities.dart';
import 'package:ecommerce/presentation/home_pages/cubit/product_by_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCategoriesList extends StatelessWidget {
  const ProductsCategoriesList({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });
  final String categoryId;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              ProductByCategoryCubit()
                ..onCategoryByProductLoad(categoryId: categoryId),
      child: BlocBuilder<ProductByCategoryCubit, ProductByCategoryState>(
        builder: (context, state) {
          if (state is ProductByCategoryLoaded) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _headText('$categoryName(${state.productList.length})'),
                  Expanded(
                    child: _gridProductList(products: state.productList),
                  ),
                ],
              ),
            );
          }
          if (state is ProductByCategoryLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is ProductByCategoryFailed) {
            return Text(state.message);
          }
          return Container();
        },
      ),
    );
  }

  Text _headText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    );
  }

  GridView _gridProductList({required List<ProductModelEntity> products}) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder:
          (context, index) => ProductCard(productList: products, index: index),
    );
  }
}
