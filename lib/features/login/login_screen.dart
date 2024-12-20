import 'package:flutter/material.dart';
import 'package:phone_input/phone_input_package.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? selectedCountryCode = '+20';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: PhoneInput(
          defaultCountry: IsoCode.EG,
          flagShape: BoxShape.rectangle,
          flagSize: 24,
          onChanged: (S) {},
          decoration: InputDecoration(
            hintText: '123 456-7890',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          countrySelectorNavigator:
              const CountrySelectorNavigator.draggableBottomSheet(),
        ),
      ),
    ));
  }
}
