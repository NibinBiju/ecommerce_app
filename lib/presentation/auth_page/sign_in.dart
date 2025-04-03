import 'package:ecommerce/common/helper/navigator.dart';
import 'package:ecommerce/core/config/theme/app_color.dart';
import 'package:ecommerce/presentation/auth_page/create_account.dart';
import 'package:ecommerce/presentation/auth_page/enter_password.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            //sign in text
            _siginText(),
            SizedBox(height: 30),
            //text field
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Email Address',
              ),
            ),
            SizedBox(height: 3),

            //Custom auth button
            CustomAuthButton(
              buttonHint: 'Continue',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EnterPasswordPage()),
                );
              },
            ),
            SizedBox(height: 3),

            //create account text
            CreateOneCustomText(
              onTap: () {
                 AppNavigator().push(
                  context: context,
                  pagesToNavi: CreateNewAccountPage(),
                );
                
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _siginText() {
    return Text(
      'SignIn',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }
}

class CreateOneCustomText extends StatelessWidget {
  const CreateOneCustomText({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: "Don't have an account ? "),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: "Create one",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({super.key, required this.buttonHint, this.onTap});

  final String buttonHint;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
