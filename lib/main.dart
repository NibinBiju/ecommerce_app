import 'package:ecommerce/common/cubit/button_state_cubit.dart';
import 'package:ecommerce/core/config/theme/app_theme.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:ecommerce/presentation/auth_page/bloc/cubit/age_selction_cubit.dart';
import 'package:ecommerce/presentation/auth_page/bloc/cubit/ages_display_cubit.dart';
import 'package:ecommerce/presentation/auth_page/bloc/cubit/gender_selection_cubit.dart';
import 'package:ecommerce/presentation/splash/cubit/splash_cubit.dart';
import 'package:ecommerce/presentation/splash/pages/splash_page.dart';
import 'package:ecommerce/service_locater.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initializeDependecies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashCubit()..appStarted()),
        BlocProvider(create: (context) => GenderSelectionCubit()),
        BlocProvider(create: (context) => AgeSelectionCubit()),
        BlocProvider(create: (context) => AgesDisplayCubit()),
        BlocProvider(create: (context) => ButtonStateCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,
        home: SplashPage(),
      ),
    );
  }
}
