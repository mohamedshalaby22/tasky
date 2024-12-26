import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/core/widgets/responsive_image.dart';
import 'package:tasky/features/on_boarding/widgets/start_button.dart';
import 'package:tasky/features/on_boarding/widgets/welcome_message.dart';

import '../../core/constants/app_images.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ResponsiveImage(imagePath: Assets.imagesAuthImage),
              const WelcomeMessage(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: StartButton(),
              ),
              verticalSpacing(40),
            ],
          ),
        ),
      ),
    );
  }
}
