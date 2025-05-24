import 'package:ecommerce/common/cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit()..getCategories(),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoaded) {
            return SizedBox(
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder:
                    (context, index) => SizedBox(
                      width: 60,
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            state.returnedData[index].title,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                separatorBuilder:
                    (context, index) =>
                        Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                itemCount: state.returnedData.length,
              ),
            );
          }
          if (state is CategoriesLoading) {
            return CircularProgressIndicator();
          }
          return Container();
        },
      ),
    );
  }
}
