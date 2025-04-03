import 'package:ecommerce/data/auth/repository/user_creation_impl.dart';
import 'package:ecommerce/data/auth/source/user_firebase_services.dart';
import 'package:ecommerce/domain/auth/repository/auth.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependecies() async {
  //srevices
  sl.registerSingleton<UserFirebaseServices>(UserFirebaseServicesImple());

  //repository
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  //usecases
}
