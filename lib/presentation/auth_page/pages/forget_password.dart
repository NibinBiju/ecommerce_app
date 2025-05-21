import 'package:ecommerce/common/cubit/button_state_cubit.dart';
import 'package:ecommerce/common/helper/app_navigator/navigator.dart';
import 'package:ecommerce/common/widgets/app_bar/app_bar.dart';
import 'package:ecommerce/common/widgets/buttons/basic_reactive_button.dart';
import 'package:ecommerce/domain/auth/usecases/send_email_forgetpassword_usecase.dart';
import 'package:ecommerce/presentation/auth_page/pages/sent_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordPage extends StatelessWidget {
  ForgetPasswordPage({super.key});
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(showBackButton: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonStateSuccess) {
              AppNavigator().push(
                context: context,
                pagesToNavi: SentEmailPage(),
              );
            }
            if (state is ButtonStateFailed) {
              var snackbar = SnackBar(
                content: Text(state.message),
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              //sign in text
              _forgetPasswordText(),
              SizedBox(height: 30),
              //text field
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Email',
                ),
              ),
              SizedBox(height: 5),

              //Custom auth button
              BasicReactiveButton(
                title: 'Continue',
                onPressed: () {
                  context.read<ButtonStateCubit>().execute(
                    usecase: SendEmailForgetPasswordUsecase(),
                    params: _emailController.text.trim(),
                  );
                },
              ),
              SizedBox(height: 5),
            ],
          ),
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
