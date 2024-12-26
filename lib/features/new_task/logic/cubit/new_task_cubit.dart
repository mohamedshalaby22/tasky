import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tasky/features/new_task/data/repos/new_task_repo.dart';
import '../../data/models/new_task_request_body.dart';
part 'new_task_state.dart';
part 'new_task_cubit.freezed.dart';

class NewTaskCubit extends Cubit<NewTaskState> {
  final NewTaskRepo _newTaskRepo;
  NewTaskCubit(this._newTaskRepo) : super(const NewTaskState.initial());
  void addTask() async {
    emit(const NewTaskState.loading());
    final response = await _newTaskRepo.addNewTask(
      AddNewTaskRequestBody(
        title: 'title',
        des: 'description',
        image: '',
        priority: '',
        dueDate: '',
      ),
    );
    response.when(
      success: (addTaskResponse) {
        emit(NewTaskState.success(addTaskResponse));
      },
      failure: (message) {
        emit(NewTaskState.error(error: message.toString()));
      },
    );
  }
}
