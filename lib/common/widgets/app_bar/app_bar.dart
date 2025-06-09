import 'package:ecommerce/core/config/theme/app_color.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    this.backgroundColor,
    this.title,
    this.action,
    this.centerTitle,
    this.showBackButton,
  });
  final Color? backgroundColor;
  final Widget? title;
  final Widget? action;
  final bool? centerTitle;
  final bool? showBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      backgroundColor: backgroundColor ?? AppColors.background,
      title: title ?? Text(''),
      actions: [action ?? Container()],
      centerTitle: centerTitle ?? false,
      leading:
          showBackButton == false
              ? null
              : Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white24,
                    child: Center(child: Icon(Icons.arrow_back_ios, size: 18)),
                  ),
                ),
              ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
