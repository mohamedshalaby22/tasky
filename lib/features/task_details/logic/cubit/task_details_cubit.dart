import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tasky/features/task_details/data/models/task_details_response.dart';
import 'package:tasky/features/task_details/data/repos/task_details_repo.dart';
part 'task_details_state.dart';
part 'task_details_cubit.freezed.dart';

class TaskDetailsCubit extends Cubit<TaskDetailsState> {
  final TaskDetailsRepo _taskDetailsRepo;
  TaskDetailsCubit(this._taskDetailsRepo)
      : super(const TaskDetailsState.initial());

  TaskDetailsResponse taskDetails = TaskDetailsResponse();
  void getTaskDetails({required String taskId}) async {
    emit(const TaskDetailsState.loading());
    final response = await _taskDetailsRepo.getTaskDetails(taskId: taskId);
    response.when(
      success: (taskDetailsResponse) {
        taskDetails = taskDetailsResponse;
        emit(TaskDetailsState.success(taskDetailsResponse));
      },
      failure: (message) {
        emit(TaskDetailsState.error(error: message.toString()));
      },
    );
  }
}
