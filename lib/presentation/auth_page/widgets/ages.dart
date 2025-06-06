import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/presentation/auth_page/cubit/age_selction_cubit.dart';
import 'package:ecommerce/presentation/auth_page/cubit/ages_display_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ages extends StatelessWidget {
  const Ages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgesDisplayCubit, AgesDisplayState>(
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.29,
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: BlocBuilder<AgesDisplayCubit, AgesDisplayState>(
              builder: (context, state) {
                if (state is AgesLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is AgesLoaded) {
                  return _ages(state.ages);
                }

                if (state is AgesLoadFailure) {
                  return Text(state.message);
                }
                return Container();
              },
            ),
          ),
        );
      },
    );
  }

  Widget _ages(List<QueryDocumentSnapshot<Map<String, dynamic>>> data) {
    return ListView.separated(
      itemBuilder:
          (context, index) => InkWell(
            onTap: () {
              Navigator.pop(context);
              context.read<AgeSelectionCubit>().selectAge(
                data[index].data()['value'],
              );
            },
            child: Text(
              data[index].data()['value'],
              style: TextStyle(fontSize: 18),
            ),
          ),
      separatorBuilder: (context, index) => SizedBox(height: 20),
      itemCount: data.length,
    );
  }
}
