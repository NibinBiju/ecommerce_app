import 'package:flutter/material.dart';

class AppNavigator {
  //to push
  void push({required BuildContext context, required Widget pagesToNavi}) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => pagesToNavi),
    );
  }

  //to pushReplace
  void pushReplace({
    required BuildContext context,
    required Widget pagesToNavi,
  }) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => pagesToNavi),
    );
  }
}
