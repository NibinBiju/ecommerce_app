import 'package:ecommerce/common/helper/search_field/search_field.dart';
import 'package:ecommerce/common/widgets/app_bar/app_bar.dart';
import 'package:ecommerce/core/config/theme/app_color.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key, required this.content});
  final Widget content;
  final TextEditingController _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: SearchFieldWidget(searchTextController: _searchTextController),
        showBackButton: true,
        backgroundColor: AppColors.background,
      ),
      body: content,
    );
  }
}
