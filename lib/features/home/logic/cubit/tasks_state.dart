part of 'tasks_cubit.dart';

@freezed
class TasksState<T> with _$TasksState {
  const factory TasksState.initial() = _Initial;
  const factory TasksState.loading() = Loading;
  const factory TasksState.success(List<TasksListResponse> todos) = Success;
  const factory TasksState.error({required String message}) = Error;

  // logout states
  const factory TasksState.logoutLoading() = LogoutLoading;
  const factory TasksState.logoutSuccess(T data) = LogoutSuccess<T>;
  const factory TasksState.logoutError({required String message}) = LogoutError;
}
