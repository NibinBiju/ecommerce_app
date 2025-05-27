import 'package:ecommerce/common/cubit/categories_cubit.dart';
import 'package:ecommerce/common/helper/app_navigator/navigator.dart';
import 'package:ecommerce/common/helper/see_all_page/see_all_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoaded) {
          return Column(
            children: [
              headLineText(
                content: ListView.builder(
                  itemCount: state.returnedData.length,
                  itemBuilder: (context, index) => Column(children: [

                        ],
                      ),
                ),
                context: context,
                headText: 'Categories',
              ),
              SizedBox(
                height: 90,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder:
                      (context, index) => SizedBox(
                        width: 80,
                        child: Column(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                state.categoriesImages[index],
                                fit: BoxFit.cover,
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
                      (context, index) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                  itemCount: state.returnedData.length,
                ),
              ),
            ],
          );
        }
        if (state is CategoriesLoading) {
          return CircularProgressIndicator();
        }
        return Container();
      },
    );
  }
}

Row headLineText({
  required String headText,
  required BuildContext context,
  required Widget content,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _headText(headText),
      InkWell(
        child: TextButton(
          onPressed: () {
            AppNavigator().push(
              context: context,
              pagesToNavi: SeeAllPage(content: content),
            );
          },
          child: Text('See All', style: TextStyle(fontSize: 16)),
        ),
      ),
    ],
  );
}

Text _headText(String text) {
  return Text(
    text,
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
  );
}
