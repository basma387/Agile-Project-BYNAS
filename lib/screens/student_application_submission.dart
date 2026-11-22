import 'package:bynas/theme/colors.dart';
import 'package:bynas/theme/textStyles.dart';
import 'package:flutter/material.dart';

class StudentApplication extends StatefulWidget {
  const StudentApplication({super.key});

  @override
  State<StudentApplication> createState() => _StudentApplicationState();
}

class _StudentApplicationState extends State<StudentApplication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.navy,
      body:Text("This Is the screen where students paster their CV links", style: TextStyles.titleBlack),
    );
  }
}