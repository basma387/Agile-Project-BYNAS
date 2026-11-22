import 'package:bynas/theme/colors.dart';
import 'package:bynas/theme/textStyles.dart';
import 'package:flutter/material.dart';

class JobBoardStudent extends StatefulWidget {
  const JobBoardStudent({super.key});

  @override
  State<JobBoardStudent> createState() => _JobBoardStudentState();
}

class _JobBoardStudentState extends State<JobBoardStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.navy,
      body:Text("This Is the student job board", style: TextStyles.titleBlack),
    );
  }
}