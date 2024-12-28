import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/theming/colors.dart';
import 'package:tasky/core/theming/styles.dart';
import 'package:tasky/features/task_details/logic/cubit/task_details_cubit.dart';
import 'package:tasky/features/task_details/ui/widgets/task_details_info.dart';

class TaskDetailsBlocBuilder extends StatelessWidget {
  const TaskDetailsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskDetailsCubit, TaskDetailsState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(loading: () {
          return Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.sizeOf(context).height / 3),
            child: const Center(
              child: CupertinoActivityIndicator(
                color: ColorsManager.mainPurple,
                radius: 14,
              ),
            ),
          );
        }, success: (tasksResonse) {
          return setupSuccess(tasksResonse);
        }, error: (errorHandler) {
          return setupError();
        }, orElse: () {
          return const SizedBox.shrink();
        });
      },
    );
  }

  Widget setupSuccess(tasksDetails) {
    return TaskDetailsInfo(
      taskDetailsResponse: tasksDetails,
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}

Widget setupEmpty(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height / 3.5),
    child: Center(
      child: Text(
        'No Tasks Available',
        style: TextStyles.font16MainPurpleBold,
      ),
    ),
  );
}
