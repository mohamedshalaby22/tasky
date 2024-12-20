import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/spacing.dart';
import 'package:tasky/features/on_boarding/widgets/start_button.dart';
import 'package:tasky/features/on_boarding/widgets/welcome_message.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpacing(40),
            Image.asset('assets/images/auth_image.png', fit: BoxFit.contain),
            const WelcomeMessage(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: StartButton(),
            ),
             verticalSpacing(40),
          ],
        ),
      ),
    );
  }
}
