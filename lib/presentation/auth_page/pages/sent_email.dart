import 'package:ecommerce/common/helper/app_navigator/navigator.dart';
import 'package:ecommerce/common/widgets/buttons/basic_app_button.dart';
import 'package:ecommerce/core/config/assets/app_vectors.dart';
import 'package:ecommerce/core/config/theme/app_color.dart';
import 'package:ecommerce/presentation/auth_page/pages/sign_in.dart';
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
            SizedBox(height: 20),
            //button
            CustomAuthButton(
              margin: EdgeInsets.only(left: 40, right: 40),
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
