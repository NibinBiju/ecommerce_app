import 'package:ecommerce/common/widgets/app_bar/app_bar.dart';
import 'package:ecommerce/core/config/theme/app_color.dart';
import 'package:flutter/material.dart';

class SeeAllPage extends StatelessWidget {
  const SeeAllPage({super.key, required this.content});
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        showBackButton: true,
        backgroundColor: AppColors.background,
      ),
      body: content,
    );
  }
}
