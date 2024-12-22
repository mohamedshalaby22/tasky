import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/features/signup/data/models/signup_request_body.dart';
import 'package:tasky/features/signup/data/repos/signup_repo.dart';
part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';

class SignUpCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignUpCubit(this._signupRepo) : super(const SignupState.initial());
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController yearsController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String level = '';
  void emitSignupStates() async {
    emit(const SignupState.loading());
    final response = await _signupRepo.signup(
      SignupRequestBody(
        phone: phoneController.text,
        password: passwordController.text,
        displayName: nameController.text,
        experienceYears: yearsController.text.toString(),
        address: addressController.text,
        level: level,
      ),
    );
    response.when(success: (signupResponse) {
      emit(SignupState.success(signupResponse));
    }, failure: (error) {
      emit(SignupState.error(error: error.toString()));
    });
  }
}
