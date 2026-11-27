import 'package:flutter/material.dart';
import '../widegt/gradlaunch_header_box.dart';
import '../widegt/selected_role_pill.dart';
import '../widegt/selection_option_box.dart';
import 'signup_company.dart';
import 'signup_student.dart';

class SignupMainScreen extends StatefulWidget {
  const SignupMainScreen({super.key});

  @override
  State<SignupMainScreen> createState() => _SignupMainScreenState();
}

class _SignupMainScreenState extends State<SignupMainScreen> {
  String selectedRole = 'Student';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFBF0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const GradLaunchHeaderBox(subtitle: 'Sign Up as:'),
              const SizedBox(height: 20),
              SelectionOptionBox(
                label: 'Student',
                isSelected: selectedRole == 'Student',
                onTap: () {
  setState(() => selectedRole = 'Student');
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SignUpStudent()),
  );
},
               // onTap: () => setState(() => selectedRole = 'Student'),
              ),
              const SizedBox(height: 16),
              SelectionOptionBox(
                label: 'Company',
                isSelected: selectedRole == 'Company',
                onTap: () {
  setState(() => selectedRole = 'Company');
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SignupCompanyScreen()),
  );
},
               // onTap: () => setState(() => selectedRole = 'Company'),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerLeft,
                child: SelectedRolePill(role: selectedRole),
              ),
            ],
          ),
        ),
      ),
    );
  }
}