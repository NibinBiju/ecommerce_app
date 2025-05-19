import 'package:ecommerce/common/helper/app_navigator/navigator.dart';
import 'package:ecommerce/common/widgets/buttons/basic_app_button.dart';
import 'package:ecommerce/data/auth/model/sign_in_model.dart';
import 'package:ecommerce/presentation/auth_page/pages/create_account.dart';
import 'package:ecommerce/presentation/auth_page/pages/enter_password.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final TextEditingController _emailController = TextEditingController();

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
              controller: _emailController,
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
                  MaterialPageRoute(
                    builder:
                        (context) => EnterPasswordPage(
                          userSigninReqModel: UserSigninReqModel(
                            email: _emailController.text.trim(),
                          ),
                        ),
                  ),
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
