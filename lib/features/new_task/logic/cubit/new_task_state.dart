part of 'new_task_cubit.dart';

@freezed
class NewTaskState<T> with _$NewTaskState {
  const factory NewTaskState.initial() = _Initial;
  const factory NewTaskState.loading() = Loading;
  const factory NewTaskState.success(T data) = Success<T>;
  const factory NewTaskState.error({required String error}) = Error;
}
