part of 'button_state_cubit.dart';

@immutable
sealed class ButtonState {}

final class ButtonStateInitial extends ButtonState {}

final class ButtonStateLoading extends ButtonState {}

final class ButtonStateSuccess extends ButtonState {}

final class ButtonStateFailed extends ButtonState {
  final String message;
  ButtonStateFailed({required this.message});
}
