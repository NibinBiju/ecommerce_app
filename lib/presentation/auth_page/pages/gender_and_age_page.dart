import 'package:ecommerce/common/cubit/button_state_cubit.dart';
import 'package:ecommerce/common/helper/app_navigator/navigator.dart';
import 'package:ecommerce/common/helper/bottom_sheet/app_bottom_sheet.dart';
import 'package:ecommerce/common/widgets/app_bar/app_bar.dart';
import 'package:ecommerce/common/widgets/buttons/basic_reactive_button.dart';
import 'package:ecommerce/core/config/theme/app_color.dart';
import 'package:ecommerce/data/auth/model/user_creation_req.dart';
import 'package:ecommerce/domain/auth/usecases/signup.dart';
import 'package:ecommerce/presentation/auth_page/cubit/age_selction_cubit.dart';
import 'package:ecommerce/presentation/auth_page/cubit/ages_display_cubit.dart';
import 'package:ecommerce/presentation/auth_page/cubit/gender_selection_cubit.dart';
import 'package:ecommerce/presentation/auth_page/pages/sign_in.dart';
import 'package:ecommerce/presentation/auth_page/widgets/ages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderAndAgePage extends StatelessWidget {
  const GenderAndAgePage({super.key, required this.userCreationReqModel});
  final UserCreationReqModel userCreationReqModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(showBackButton: true),
      body: BlocListener<ButtonStateCubit, ButtonState>(
        listener: (context, state) {
          if (state is ButtonStateFailed) {
            var snackbar = SnackBar(
              content: Text(state.message),
              behavior: SnackBarBehavior.floating,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          }
          if (state is ButtonStateSuccess) {
            AppNavigator().push(context: context, pagesToNavi: SignInPage());
          }
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  //sign in text
                  _tellUsAboutText(),
                  SizedBox(height: 2),
                  //gender
                  _gender(context),
                  SizedBox(height: 5),
                  _howOldAreYouText(),
                  _age(context),
                ],
              ),
            ),
            Spacer(),
            _finishButton(context),
          ],
        ),
      ),
    );
  }

  Widget _finishButton(BuildContext context) {
    return Container(
      height: 100,
      color: AppColors.secondBackground,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Builder(
          builder:
              (context) => BasicReactiveButton(
                onPressed: () {
                  userCreationReqModel.gender =
                      context.read<GenderSelectionCubit>().selectedGenderIndex;
                  userCreationReqModel.age =
                      context.read<AgeSelectionCubit>().selectedAge;
                  context.read<ButtonStateCubit>().execute(
                    usecase: SignupUsecases(),
                    params: userCreationReqModel,
                  );
                },
                title: 'Finish',
              ),
        ),
      ),
    );
  }

  Widget _age(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          AppBottomSheet.display(
            context,
            MultiBlocProvider(
              providers: [
                BlocProvider.value(value: context.read<AgeSelectionCubit>()),
                BlocProvider.value(
                  value: context.read<AgesDisplayCubit>()..displayAges(),
                ),
              ],
              child: Ages(),
            ),
          );
        },
        child: BlocBuilder<AgeSelectionCubit, String>(
          builder: (context, state) {
            return Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: AppColors.secondBackground,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    state == "" ? 'Age Range' : state,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                  Icon(Icons.keyboard_arrow_down_rounded),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _gender(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _genderTile(context: context, gender: 'Male', genderId: 1),
        SizedBox(height: 20),
        _genderTile(context: context, gender: 'Women', genderId: 2),
      ],
    );
  }

  Expanded _genderTile({
    required BuildContext context,
    required String gender,
    required int genderId,
  }) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          context.read<GenderSelectionCubit>().selectGender(genderId);
        },
        child: BlocBuilder<GenderSelectionCubit, int>(
          builder: (context, state) {
            return Container(
              height: 60,
              decoration: BoxDecoration(
                color:
                    context.read<GenderSelectionCubit>().selectedGenderIndex ==
                            genderId
                        ? AppColors.primary
                        : AppColors.secondBackground,
                borderRadius: BorderRadius.circular(30),
              ),
              margin: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  gender,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  //Methods
  Widget _tellUsAboutText() {
    return Text(
      'Tell us About Yourself',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }

  Widget _howOldAreYouText() {
    return Text(
      'How old are you ?',
      style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
    );
  }
}
