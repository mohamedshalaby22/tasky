import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/theming/colors.dart';
import 'package:tasky/features/profile/logic/cubit/profile_cubit.dart';
import 'package:tasky/features/profile/ui/widgets/profile_info.dart';

class ProfileBlocBuilder extends StatelessWidget {
  const ProfileBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(loading: () {
          return Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.sizeOf(context).height / 3),
            child: const Center(
              child: CupertinoActivityIndicator(
                color: ColorsManager.mainPurple,
                radius: 13,
              ),
            ),
          );
        }, success: (profileData) {
          var data = profileData;
          return setupSuccess(data);
        }, error: (errorHandler) {
          return setupError();
        }, orElse: () {
          return const SizedBox.shrink();
        });
      },
    );
  }

  Widget setupSuccess(profileResponse) {
    return ProfileInfo(
      profileResponse: profileResponse,
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
