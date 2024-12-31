import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tasky/features/task_details/data/models/task_details_response.dart';
import 'package:tasky/features/task_details/data/repos/task_details_repo.dart';

import '../../../../core/helpers/haptic_feedback.dart';
part 'task_details_state.dart';
part 'task_details_cubit.freezed.dart';

class TaskDetailsCubit extends Cubit<TaskDetailsState> {
  final TaskDetailsRepo _taskDetailsRepo;
  final String taskId;
  TaskDetailsCubit(this._taskDetailsRepo, this.taskId)
      : super(const TaskDetailsState.initial());

  TaskDetailsResponse taskDetails = TaskDetailsResponse();
  void getTaskDetails() async {
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

  void deleteTask() async {
    emit(const TaskDetailsState.deleteLoading());
    final response = await _taskDetailsRepo.deleteTask(taskId: taskId);
    response.when(success: (logoutResponse) async {
      emit(const TaskDetailsState.deleteSuccess());
      await HapticFeedbackExtension.vibrateSelection();
    }, failure: (error) {
      emit(TaskDetailsState.deleteError(message: error.toString()));
    });
  }
}
