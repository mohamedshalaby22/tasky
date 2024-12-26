import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/helpers/token_storage.dart';
import 'package:tasky/features/login/data/models/login_request_body.dart';
import 'package:tasky/features/login/data/repos/login_repo.dart';
part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  final formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
          phone: phoneController.text, password: passwordController.text),
    );
    response.when(success: (loginResponse) async {
      await TokenStorage.saveTokens(
        accessToken: loginResponse.accessToken,
        refreshToken: loginResponse.refreshToken,
      );

      emit(LoginState.success(loginResponse));
    }, failure: (error) {
      emit(LoginState.error(error: error.toString()));
    });
  }
}
