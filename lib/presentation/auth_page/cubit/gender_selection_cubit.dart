import 'package:flutter_bloc/flutter_bloc.dart';

class GenderSelectionCubit extends Cubit<int> {
  GenderSelectionCubit() : super(0);

  int selectedGenderIndex = 0;

  void selectGender(int genderId) {
    selectedGenderIndex = genderId;
    emit(selectedGenderIndex);
  }
}
