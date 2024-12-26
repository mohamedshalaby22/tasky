import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/helpers/extensions.dart';
import 'package:tasky/features/home/logic/cubit/tasks_cubit.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';

class LogoutBlocListener extends StatelessWidget {
  const LogoutBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TasksCubit, TasksState>(
      listenWhen: (previous, current) =>
          current is LogoutLoading ||
          current is LogoutSuccess ||
          current is LogoutError,
      listener: (context, state) {
        state.whenOrNull(
          logoutLoading: () {
            context.pop();
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainPurple,
                ),
              ),
            );
          },
          logoutSuccess: (logoutResponse) {
           
            context.pop();
            context.pushReplacementNamed(Routes.onBoardingScreen);
          },
          logoutError: (error) {
            context.pop();
           
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
