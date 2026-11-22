import 'package:bynas/theme/colors.dart';
import 'package:bynas/theme/textStyles.dart';
import 'package:flutter/material.dart';

class JobBoardCareerOffice extends StatefulWidget {
  const JobBoardCareerOffice({super.key});

  @override
  State<JobBoardCareerOffice> createState() => _JobBoardCareerOfficeState();
}

class _JobBoardCareerOfficeState extends State<JobBoardCareerOffice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.navy,
      body:Text("This Is the career office job board", style: TextStyles.titleBlack),
    );
  }
}