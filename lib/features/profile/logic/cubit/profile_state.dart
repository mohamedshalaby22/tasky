part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = Loading;
  const factory ProfileState.success(ProfileResponse data) = Success;
  const factory ProfileState.error({required String error}) = Error;
}
