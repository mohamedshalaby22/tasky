import 'package:flutter/widgets.dart';
import 'package:tasky/features/profile/data/models/profile_response.dart';
import 'package:tasky/features/profile/ui/widgets/user_profile_info_row.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key, required this.profileResponse});
  final ProfileResponse profileResponse;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserProfileInfoRow(
          title: 'NAME',
          subTitle: profileResponse.userName,
        ),
        UserProfileInfoRow(
          title: 'PHONE',
          subTitle: profileResponse.phoneNumber,
          canCopy: true,
        ),
        UserProfileInfoRow(
          title: 'LEVEL',
          subTitle: profileResponse.level,
        ),
        UserProfileInfoRow(
          title: 'YEARS OF EXOERIENCE',
          subTitle: '${profileResponse.experienceYears} years',
        ),
        UserProfileInfoRow(
          title: 'LOCATION',
          subTitle: profileResponse.address,
        ),
      ],
    );
  }
}
