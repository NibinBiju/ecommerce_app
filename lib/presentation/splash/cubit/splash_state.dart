part of 'splash_cubit.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}

final class AuthenticatedSplash extends SplashState {}

final class UnAuthenticatedSplash extends SplashState {}
