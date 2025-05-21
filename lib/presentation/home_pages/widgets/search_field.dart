import 'package:ecommerce/core/config/assets/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({super.key, required this.searchTextController});
  final TextEditingController searchTextController;

  @override
  Widget build(BuildContext context) {
    return TextField(
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
