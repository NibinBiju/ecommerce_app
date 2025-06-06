import 'package:ecommerce/common/cubit/categories_cubit.dart';
import 'package:ecommerce/core/config/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoriesVerticalList extends StatelessWidget {
  const CategoriesVerticalList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit()..getCategories(),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is CategoriesLoaded) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _headText('Shop by Categories'),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.returnedData.length,
                      itemBuilder:
                          (context, index) => Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            margin: EdgeInsets.only(top: 8, bottom: 8),
                            height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.secondBackground,
                            ),
                            child: Row(
                              spacing: 12,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 27,
                                  backgroundColor: Colors.white,
                                  child: SvgPicture.asset(
                                    state.categoriesImages[index],
                                  ),
                                ),
                                _normalText(state.returnedData[index].title),
                              ],
                            ),
                          ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}

Text _headText(String text) {
  return Text(
    text,
    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
  );
}

Text _normalText(String text) {
  return Text(text, style: TextStyle(fontSize: 20));
}
