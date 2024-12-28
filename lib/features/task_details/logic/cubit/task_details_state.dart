part of 'task_details_cubit.dart';

@freezed
class TaskDetailsState with _$TaskDetailsState {
  const factory TaskDetailsState.initial() = _Initial;
  const factory TaskDetailsState.loading() = Loading;
  const factory TaskDetailsState.success(TaskDetailsResponse taskDetails) = Success;
  const factory TaskDetailsState.error({required String error}) = Error;
}
