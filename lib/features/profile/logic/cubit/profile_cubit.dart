import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tasky/features/profile/data/models/profile_response.dart';
import 'package:tasky/features/profile/data/repos/profile_repo.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  ProfileCubit(this._profileRepo) : super(const ProfileState.initial());

  ProfileResponse profileResponse = ProfileResponse();
  void getProfileData() async {
    emit(const ProfileState.loading());
    final response = await _profileRepo.getProfile();
    response.when(success: (profileResponseModel) {
      profileResponse = profileResponseModel;
      emit(ProfileState.success(profileResponseModel));
    }, failure: (error) {
      emit(ProfileState.error(error: error.toString()));
    });
  }
}
