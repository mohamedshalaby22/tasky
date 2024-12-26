import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/theming/colors.dart';
import 'package:tasky/features/profile/logic/cubit/profile_cubit.dart';

class ProfileBlocBuilder extends StatelessWidget {
  const ProfileBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () {
              return const CupertinoActivityIndicator(
                color: ColorsManager.mainPurple,
                radius: 14,
              );
            },
            success: (specializationDataList) {
              var specializationsList = specializationDataList;
              return setupSuccess(specializationsList);
            },
            error: (errorHandler) => setupError(),
            orElse: () {
              return const SizedBox.shrink();
            });
      },
    );
  }

  Widget setupSuccess(specializationsList) {
    return const SizedBox.shrink();
    // return ProfileInfoWidget
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
