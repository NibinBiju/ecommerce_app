import 'package:ecommerce/common/helper/navigator.dart';
import 'package:ecommerce/core/config/assets/app_vectors.dart';
import 'package:ecommerce/core/config/theme/app_color.dart';
import 'package:ecommerce/presentation/auth_page/sign_in.dart';
import 'package:ecommerce/presentation/splash/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticatedSplash) {
          AppNavigator().push(context: context, pagesToNavi: SignInPage());
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(child: SvgPicture.asset(AppVectors.appLogo)),
      ),
    );
  }
}
