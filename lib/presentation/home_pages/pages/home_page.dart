import 'package:ecommerce/common/cubit/categories_cubit.dart';
import 'package:ecommerce/common/helper/app_navigator/navigator.dart';
import 'package:ecommerce/common/helper/products/product_hori_list.dart';
import 'package:ecommerce/common/helper/see_all_page/see_all_page.dart';
import 'package:ecommerce/core/config/assets/app_images.dart';
import 'package:ecommerce/core/config/assets/app_vectors.dart';
import 'package:ecommerce/core/config/theme/app_color.dart';
import 'package:ecommerce/domain/auth/entity/user_model_entity.dart';
import 'package:ecommerce/domain/product/usecases/get_new_inproducts.dart';
import 'package:ecommerce/domain/product/usecases/get_topproducts_usecases.dart';
import 'package:ecommerce/presentation/home_pages/cubit/products_cubit.dart';
import 'package:ecommerce/presentation/home_pages/cubit/user_info_display_cubit.dart';
import 'package:ecommerce/presentation/home_pages/widgets/categories_list.dart';
import 'package:ecommerce/presentation/home_pages/widgets/categories_section.dart';
import 'package:ecommerce/presentation/home_pages/widgets/search_field.dart';
import 'package:ecommerce/service_locater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TextEditingController _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CategoriesCubit()..getCategories()),
        ],

        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
              child: Column(
                children: [
                  //profile section
                  BlocProvider(
                    create: (context) => UserInfoDisplayCubit()..getUser(),
                    child:
                        BlocBuilder<UserInfoDisplayCubit, UserInfoDisplayState>(
                          builder: (context, state) {
                            if (state is UserInfoDisplayLoading) {
                              return Center(child: CircularProgressIndicator());
                            }
                            if (state is UserInfoDisplayLoaded) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _profileImage(state.userModelEntity),
                                  _gender(state.userModelEntity, context),
                                  _cartOption(),
                                ],
                              );
                            }
                            return Container();
                          },
                        ),
                  ),
                  SizedBox(height: 20),
                  //search field
                  SearchFieldWidget(
                    searchTextController: _searchTextController,
                  ),
                  //categories
                  headLineText(
                    content: CategoriesVerticalList(),
                    context: context,
                    headText: 'Categories',
                    seeAlloption: true,
                  ),
                  //categories section
                  CategoriesSection(),
                  //categories
                  headLineText(
                    content: Container(),
                    context: context,
                    headText: 'Top Selling',
                    seeAlloption: false,
                  ),
                  GetTopProducts(),
                  headLineText(
                    content: Container(),
                    context: context,
                    headText: 'New In',
                    seeAlloption: false,
                  ),
                  GetNewProducts(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row headLineText({
    required String headText,
    required BuildContext context,
    required Widget content,
    required bool seeAlloption,
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
            child:
                seeAlloption
                    ? Text('See All', style: TextStyle(fontSize: 16))
                    : Container(),
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

  CircleAvatar _cartOption() =>
      CircleAvatar(child: SvgPicture.asset(AppVectors.bagIcon));

  Container _gender(UserModelEntity user, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Row(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              user.gender == 1 ? 'Men' : 'Women',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SvgPicture.asset(AppVectors.dropdownIcon),
          ],
        ),
      ),
    );
  }

  CircleAvatar _profileImage(UserModelEntity user) => CircleAvatar(
    backgroundColor: Colors.orange,
    backgroundImage:
        user.image.isNotEmpty
            ? NetworkImage(user.image)
            : AssetImage(AppImages.profileimage),
  );
}

class GetNewProducts extends StatelessWidget {
  const GetNewProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              ProductsCubit(usecase: GetNewInProducts())..getProducts(),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is ProductsLoaded) {
            return ProductHorizontalListWidget(
              productList: state.productModelEntity,
            );
          }
          if (state is ProductsFailed) {
            return SizedBox(width: double.infinity, child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}

class GetTopProducts extends StatelessWidget {
  const GetTopProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              ProductsCubit(usecase: sl<GetproductsUsecases>())..getProducts(),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is ProductsLoaded) {
            return ProductHorizontalListWidget(
              productList: state.productModelEntity,
            );
          }
          if (state is ProductsFailed) {
            return SizedBox(width: double.infinity, child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
