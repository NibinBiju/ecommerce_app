import 'package:ecommerce/common/helper/app_navigator/navigator.dart';
import 'package:ecommerce/common/widgets/app_bar/app_bar.dart';
import 'package:ecommerce/common/widgets/buttons/basic_app_button.dart';
import 'package:ecommerce/presentation/auth_page/pages/sent_email.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(showBackButton: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            //sign in text
            _forgetPasswordText(),
            SizedBox(height: 30),
            //text field
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Password',
              ),
            ),
            SizedBox(height: 5),

            //Custom auth button
            CustomAuthButton(
              buttonHint: 'Continue',
              onTap: () {
                AppNavigator().push(
                  context: context,
                  pagesToNavi: SentEmailPage(),
                );
              },
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  Widget _forgetPasswordText() {
    return Text(
      'Forgot Password',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }
}
