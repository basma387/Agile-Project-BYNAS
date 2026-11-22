import 'package:bynas/theme/colors.dart';
import 'package:bynas/theme/textStyles.dart';
import 'package:flutter/material.dart';

class JobApplicantView extends StatefulWidget {
  const JobApplicantView({super.key});

  @override
  State<JobApplicantView> createState() => _JobApplicantViewState();
}

class _JobApplicantViewState extends State<JobApplicantView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.navy,
      body:Text("This Is the screen where companies can view jop applicants", style: TextStyles.titleBlack),
    );
  }
}