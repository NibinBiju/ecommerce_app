import 'package:ecommerce/data/auth/repository/user_creation_impl.dart';
import 'package:ecommerce/data/auth/source/user_firebase_services.dart';
import 'package:ecommerce/data/category_data/repository_impl/category_repo_impl.dart';
import 'package:ecommerce/data/category_data/source/category_firebase_services.dart';
import 'package:ecommerce/domain/auth/repository/auth.dart';
import 'package:ecommerce/domain/auth/usecases/get_user.dart';
import 'package:ecommerce/domain/auth/usecases/getages_usecases.dart';
import 'package:ecommerce/domain/auth/usecases/is_loggedin_usecases.dart';
import 'package:ecommerce/domain/auth/usecases/send_email_forgetpassword_usecase.dart';
import 'package:ecommerce/domain/auth/usecases/signin_usecase.dart';
import 'package:ecommerce/domain/auth/usecases/signup.dart';
import 'package:ecommerce/domain/categorys/repository/category_repo.dart';
import 'package:ecommerce/domain/categorys/usecases/get_categories_usecases.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependecies() async {
  //srevices
  sl.registerSingleton<UserFirebaseServices>(UserFirebaseServicesImple());
  sl.registerSingleton<CategoryFirebaseServices>(
    CategoryFirebaseServicesImpl(),
  );

  //repository
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  //signup usecases
  sl.registerSingleton<SignupUsecases>(SignupUsecases());

  //getage usecases
  sl.registerSingleton<GetAgesUsecases>(GetAgesUsecases());

  //signin usecases
  sl.registerSingleton<SigninUsecases>(SigninUsecases());

  //signin usecases
  sl.registerSingleton<SendEmailForgetPasswordUsecase>(
    SendEmailForgetPasswordUsecase(),
  );
  //is logged
  sl.registerSingleton<IsLoggedinUsecase>(IsLoggedinUsecase());

  //get user
  sl.registerSingleton<GetUserUsecases>(GetUserUsecases());

  //category repo
  sl.registerSingleton<CategoryRepository>(CategoryRepoImpl());

  //Get categories usecases
  sl.registerSingleton<GetCategoriesUsecases>(GetCategoriesUsecases());
}
