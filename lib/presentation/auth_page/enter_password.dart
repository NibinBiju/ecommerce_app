import 'package:ecommerce/common/helper/navigator.dart';
import 'package:ecommerce/common/widgets/app_bar.dart';
import 'package:ecommerce/core/config/theme/app_color.dart';
import 'package:ecommerce/presentation/auth_page/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class EnterPasswordPage extends StatelessWidget {
  const EnterPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 10,
          children: [
            //sign in text
            _enterPassword(),
            SizedBox(height: 30),
            //text field
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Password',
              ),
            ),
            SizedBox(height: 3),

            //Custom auth button
            CustomAuthButton(buttonHint: 'Continue', onTap: () {}),
            SizedBox(height: 3),
            EnterPasswordCustomText(
              onTap: () {
                AppNavigator().push(
                  context: context,
                  pagesToNavi: ForgetPasswordPage(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _enterPassword() {
    return Text(
      'SignIn',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }
}

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({super.key, required this.buttonHint, this.onTap});

  final String buttonHint;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(27),
        ),
        child: Center(
          child: Text(
            buttonHint,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class EnterPasswordCustomText extends StatelessWidget {
  const EnterPasswordCustomText({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: "Forgot password ? "),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: "reset",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
