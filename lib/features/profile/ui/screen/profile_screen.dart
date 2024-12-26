import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/core/widgets/custom_appbar.dart';
import 'package:tasky/features/profile/ui/widgets/user_profile_info_row.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Profile'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                verticalSpacing(10),
                // User profile info
                const UserProfileInfoRow(
                  title: 'NAME',
                  subTitle: 'John Doe',
                ),
                const UserProfileInfoRow(
                  title: 'PHONE',
                  subTitle: '+20 123 456-7890',
                  canCopy: true,
                ),
                const UserProfileInfoRow(
                  title: 'LEVEL',
                  subTitle: 'Senior',
                ),
                const UserProfileInfoRow(
                  title: 'YEARS OF EXOERIENCE',
                  subTitle: '7 years',
                ),
                const UserProfileInfoRow(
                  title: 'LOCATION',
                  subTitle: 'Zefta, Egypt',
                ),
                // User profile Bloc Builder
              ],
            ),
          ),
        ),
      ),
    );
  }
}
