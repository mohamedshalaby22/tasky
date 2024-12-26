import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tasky/features/home/data/models/tasks_list_response.dart';
import 'package:tasky/features/home/data/repo/tasks_repo.dart';
part 'tasks_state.dart';
part 'tasks_cubit.freezed.dart';

class TasksCubit extends Cubit<TasksState> {
  final TasksRepo _todosRepo;
  TasksCubit(this._todosRepo) : super(const TasksState.initial());

  List<TasksListResponse> todos = [];
  void getTodos() async {
      emit(const TasksState.loading());
      final response = await _todosRepo.getTodos();
      response.when(success: (todosListModel) {
        todos = todosListModel;
        emit(TasksState.success(todos));
      }, failure: (error) {
        emit(TasksState.error(message: error.toString()));
      });
    } 
  
}
