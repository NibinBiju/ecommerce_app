import 'package:ecommerce/common/helper/navigator.dart';
import 'package:ecommerce/core/config/assets/app_vectors.dart';
import 'package:ecommerce/core/config/theme/app_color.dart';
import 'package:ecommerce/presentation/auth_page/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SentEmailPage extends StatelessWidget {
  const SentEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          children: [
            //image
            SvgPicture.asset(AppVectors.emailSendImage),
            //text
            _sendMailForgetPasswordText(),
            //button
            CustomAuthButton(
              buttonHint: 'Return to Login',
              onTap: () {
                AppNavigator().push(
                  context: context,
                  pagesToNavi: SignInPage(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget _sendMailForgetPasswordText() {
  return Text(
    'We Sent you an Email to reset your password.',
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  );
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
        margin: EdgeInsets.only(left: 100, right: 100),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(27),
        ),
        child: Center(
          child: Text(
            buttonHint,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
