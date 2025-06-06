part of 'ages_display_cubit.dart';

@immutable
sealed class AgesDisplayState {}

final class AgesInitial extends AgesDisplayState {}

final class AgesLoading extends AgesDisplayState {}

final class AgesLoaded extends AgesDisplayState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> ages;
  AgesLoaded({required this.ages});
}

final class AgesLoadFailure extends AgesDisplayState {
  final String message;

  AgesLoadFailure({required this.message});
}
