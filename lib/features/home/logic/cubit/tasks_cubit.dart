import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tasky/core/helpers/haptic_feedback.dart';
import 'package:tasky/core/helpers/token_storage.dart';
import 'package:tasky/features/home/data/models/logout_request_body.dart';
import 'package:tasky/features/home/data/models/tasks_list_response.dart';
import 'package:tasky/features/home/data/repo/tasks_repo.dart';
part 'tasks_state.dart';
part 'tasks_cubit.freezed.dart';

class TasksCubit extends Cubit<TasksState> {
  final TasksRepo _todosRepo;
  TasksCubit(this._todosRepo) : super(const TasksState.initial());

  Future<void> getTasks() async {
    emit(const TasksState.loading());
    final response = await _todosRepo.getTodos();
    response.when(success: (todosListModel) {
      if (todosListModel.isNotEmpty) {
        emit(TasksState.success(todosListModel));
      } else {
        emit(const TasksState.empty());
      }
    }, failure: (error) {
      if (isClosed) return;
      emit(TasksState.error(message: error.toString()));
    });
  }

  void logout() async {
    final token = await TokenStorage.getAccessToken();
    emit(const TasksState.logoutLoading());
    final response = await _todosRepo.logout(LogoutRequestBody(
      token: token ?? '',
    ));
    response.when(success: (logoutResponse) async {
      await TokenStorage.deleteTokens();
      emit(TasksState.logoutSuccess(logoutResponse));
      await HapticFeedbackExtension.vibrateSelection();
    }, failure: (error) {
      emit(TasksState.logoutError(message: error.toString()));
    });
  }
}
