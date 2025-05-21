import 'package:ecommerce/common/cubit/button_state_cubit.dart';
import 'package:ecommerce/common/helper/app_navigator/navigator.dart';
import 'package:ecommerce/common/widgets/app_bar/app_bar.dart';
import 'package:ecommerce/common/widgets/buttons/basic_reactive_button.dart';
import 'package:ecommerce/data/auth/model/sign_in_model.dart';
import 'package:ecommerce/domain/auth/usecases/signin_usecase.dart';
import 'package:ecommerce/presentation/auth_page/pages/forget_password.dart';
import 'package:ecommerce/presentation/home_pages/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterPasswordPage extends StatelessWidget {
  final UserSigninReqModel userSigninReqModel;
  EnterPasswordPage({super.key, required this.userSigninReqModel});
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: BlocListener<ButtonStateCubit, ButtonState>(
        listener: (context, state) {
          if (state is ButtonStateFailed) {
            var snackbar = SnackBar(
              content: Text(state.message),
              behavior: SnackBarBehavior.floating,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          }
          if (state is ButtonStateSuccess) {
            AppNavigator().pushReplace(
              context: context,
              pagesToNavi: HomePage(),
            );
          }
        },
        child: Padding(
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
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Password',
                ),
              ),
              SizedBox(height: 3),

              //Custom auth button
              BasicReactiveButton(
                title: 'Continue',
                onPressed: () async {
                  userSigninReqModel.password = _passwordController.text;
                  context.read<ButtonStateCubit>().execute(
                    usecase: SigninUsecases(),
                    params: userSigninReqModel,
                  );
                },
              ),
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
