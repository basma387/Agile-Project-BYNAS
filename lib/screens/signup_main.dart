import 'package:bynas/theme/colors.dart';
import 'package:bynas/theme/textStyles.dart';
import 'package:flutter/material.dart';

class SignUpMain extends StatefulWidget {
  const SignUpMain({super.key});

  @override
  State<SignUpMain> createState() => _SignUpMainState();
}

class _SignUpMainState extends State<SignUpMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.navy,
      body:Text("This Is the main sign up screen", style: TextStyles.titleBlack),
    );
  }
}