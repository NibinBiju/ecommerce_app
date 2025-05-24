import 'package:ecommerce/core/config/assets/app_images.dart';
import 'package:ecommerce/core/config/assets/app_vectors.dart';
import 'package:ecommerce/core/config/theme/app_color.dart';
import 'package:ecommerce/domain/auth/entity/user_model_entity.dart';
import 'package:ecommerce/presentation/home_pages/cubit/user_info_display_cubit.dart';
import 'package:ecommerce/presentation/home_pages/widgets/categories_section.dart';
import 'package:ecommerce/presentation/home_pages/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TextEditingController _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 5),
          child: Column(
            children: [
              //profile section
              BlocProvider(
                create: (context) => UserInfoDisplayCubit()..getUser(),
                child: BlocBuilder<UserInfoDisplayCubit, UserInfoDisplayState>(
                  builder: (context, state) {
                    if (state is UserInfoDisplayLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is UserInfoDisplayLoaded) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              SearchFieldWidget(searchTextController: _searchTextController),
              SizedBox(height: 20),
              //categories
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _headText('Categories'),
                  Text('See All', style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 5),
              CategoriesSection(),
            ],
          ),
        ),
      ),
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
