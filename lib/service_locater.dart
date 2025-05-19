import 'package:ecommerce/data/auth/repository/user_creation_impl.dart';
import 'package:ecommerce/data/auth/source/user_firebase_services.dart';
import 'package:ecommerce/domain/auth/usecases/getages_usecases.dart';
import 'package:ecommerce/domain/auth/usecases/signin_usecase.dart';
import 'package:ecommerce/domain/auth/usecases/signup.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependecies() async {
  //srevices
  sl.registerSingleton<UserFirebaseServices>(UserFirebaseServicesImple());

  //repository
  sl.registerSingleton<AuthRepositoryImpl>(AuthRepositoryImpl());

  //signup usecases
  sl.registerSingleton<SignupUsecases>(SignupUsecases());

  //getage usecases
  sl.registerSingleton<GetAgesUsecases>(GetAgesUsecases());

  //signin usecases
  sl.registerSingleton<SigninUsecases>(SigninUsecases());

}
