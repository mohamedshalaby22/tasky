part of 'sign_up_cubit.dart';

@freezed
class SignupState<T> with _$SignupState {
  const factory SignupState.initial() = _Initial;
  const factory SignupState.loading() = Loading;
  const factory SignupState.success(T data) = Success<T>;
  const factory SignupState.error({required String error}) = Error;
}
