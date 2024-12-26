import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/core/widgets/custom_appbar.dart';
import 'package:tasky/features/profile/ui/widgets/profile_bloc_builder.dart';

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
                const ProfileBlocBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
