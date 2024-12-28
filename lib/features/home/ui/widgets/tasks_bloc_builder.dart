import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/theming/colors.dart';
import 'package:tasky/features/home/logic/cubit/tasks_cubit.dart';
import 'package:tasky/features/home/ui/widgets/task_list_view.dart';

class TasksBlocBuilder extends StatelessWidget {
  const TasksBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(loading: () {
          return Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.sizeOf(context).height / 3.5),
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

  Widget setupSuccess(tasksList) {
    return TasksListView(tasksList: tasksList);
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
