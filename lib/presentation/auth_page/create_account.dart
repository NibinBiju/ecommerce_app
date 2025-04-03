import 'package:ecommerce/common/helper/navigator.dart';
import 'package:ecommerce/common/widgets/app_bar.dart';
import 'package:ecommerce/core/config/theme/app_color.dart';
import 'package:ecommerce/presentation/auth_page/sign_in.dart';
import 'package:flutter/material.dart';

class CreateNewAccountPage extends StatelessWidget {
  CreateNewAccountPage({super.key});

  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(showBackButton: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              //sign in text
              _createNewAccountText(),
              SizedBox(height: 30),
              //text field first name
              _createAccountField(
                hint: "Enter First Name",
                controller: firstnameController,
              ),
              //text field last name
              _createAccountField(
                hint: "Enter Last Name",
                controller: lastnameController,
              ),
              //text field email
              _createAccountField(
                hint: "Enter Email Address",
                controller: emailController,
              ),
              //text field password
              _createAccountField(
                hint: "Enter Password",
                controller: passwordController,
              ),
              SizedBox(height: 3),
              //Custom auth button
              CustomAuthButton(
                buttonHint: 'Continue',
                onTap: () {
                  AppNavigator().push(
                    context: context,
                    pagesToNavi: SignInPage(),
                  );
                },
              ),
              SizedBox(height: 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createAccountField({
    required String hint,
    TextEditingController? controller,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(border: OutlineInputBorder(), hintText: hint),
    );
  }

  Widget _createNewAccountText() {
    return Text(
      'Create New Account',
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
