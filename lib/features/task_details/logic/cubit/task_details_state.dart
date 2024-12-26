part of 'task_details_cubit.dart';

@freezed
class TaskDetailsState<T> with _$TaskDetailsState {
  const factory TaskDetailsState.initial() = _Initial;
  const factory TaskDetailsState.loading() = Loading;
  const factory TaskDetailsState.success(T data) = Success<T>;
  const factory TaskDetailsState.error({required String error}) = Error;
}
