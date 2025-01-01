part of 'edit_task_cubit.dart';

@freezed
class EditTaskState<T> with _$EditTaskState {
  const factory EditTaskState.initial() = _Initial;
  const factory EditTaskState.loading() = Loading;
  const factory EditTaskState.success(T data) = Success<T>;
  const factory EditTaskState.error({required String error}) = Error;
  const factory EditTaskState.imageSelected({required File image}) =
      ImageSelected;
}
