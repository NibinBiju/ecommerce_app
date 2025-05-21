part of 'user_info_display_cubit.dart';

@immutable
sealed class UserInfoDisplayState {}

final class UserInfoDisplayLoading extends UserInfoDisplayState {}

final class UserInfoDisplayLoaded extends UserInfoDisplayState {
  final UserModelEntity userModelEntity;

  UserInfoDisplayLoaded({required this.userModelEntity});
}

final class UserInfoDisplayFailed extends UserInfoDisplayState {
  final String message;

  UserInfoDisplayFailed({required this.message});
}
