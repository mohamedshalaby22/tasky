part of 'tasks_cubit.dart';

@freezed
class TasksState with _$TasksState {
  const factory TasksState.initial() = _Initial;
  const factory TasksState.loading() = Loading;
  const factory TasksState.success(List<TasksListResponse> todos) = Success;
  const factory TasksState.error({required String message}) = Error;
}
