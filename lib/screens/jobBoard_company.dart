import 'package:bynas/theme/colors.dart';
import 'package:bynas/theme/textStyles.dart';
import 'package:flutter/material.dart';

class JobBoardCompany extends StatefulWidget {
  const JobBoardCompany({super.key});

  @override
  State<JobBoardCompany> createState() => _JobBoardCompanyState();
}

class _JobBoardCompanyState extends State<JobBoardCompany> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.navy,
      body:Text("This Is the company job board", style: TextStyles.titleBlack),
    );
  }
}