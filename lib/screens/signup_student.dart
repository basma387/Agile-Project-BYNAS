import 'package:bynas/theme/colors.dart';
import 'package:bynas/theme/textStyles.dart';
import 'package:flutter/material.dart';

class SignUpStudent extends StatefulWidget {
  const SignUpStudent({super.key});

  @override
  State<SignUpStudent> createState() => _SignUpStudentState();
}

class _SignUpStudentState extends State<SignUpStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.navy,
      body:Text("This Is the sign up screen for students", style: TextStyles.titleBlack),
    );
  }
}