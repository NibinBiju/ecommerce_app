import 'package:ecommerce/core/config/assets/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    super.key,
    required this.searchTextController,
    this.readOnly = false,
    this.onTap,
  });
  final TextEditingController searchTextController;
  final bool readOnly;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
        hintText: 'Search',
        filled: true,
        prefixIcon: SvgPicture.asset(AppVectors.searchIcon, fit: BoxFit.none),
        hintStyle: TextStyle(color: Colors.white),
      ),
    );
  }
}
