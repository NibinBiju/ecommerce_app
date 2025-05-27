import 'package:ecommerce/common/widgets/app_bar/app_bar.dart';
import 'package:flutter/material.dart';

class SeeAllPage extends StatelessWidget {
  const SeeAllPage({super.key, required this.content});
 final Widget content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBarWidget(showBackButton: true),
      body: content,
    );
  }
}
