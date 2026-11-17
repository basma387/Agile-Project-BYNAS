import 'package:bynas/theme/colors.dart';
import 'package:bynas/theme/textStyles.dart';
import 'package:flutter/material.dart';

class JobBoard extends StatefulWidget {
  const JobBoard({super.key});

  @override
  State<JobBoard> createState() => _JobBoardState();
}

class _JobBoardState extends State<JobBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.navy,
      body:Text("This Is the job board", style: TextStyles.titleBlack),
    );
  }
}