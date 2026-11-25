import 'package:flutter/material.dart';
import '../widegt/company_form_fields.dart';
import '../widegt/gradlaunch_header_box.dart';

class SignupCompanyScreen extends StatefulWidget {
  const SignupCompanyScreen({super.key});

  @override
  State<SignupCompanyScreen> createState() => _SignupCompanyScreenState();
}

class _SignupCompanyScreenState extends State<SignupCompanyScreen> {
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _companyNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSignUpPressed() {
    // هنا تقدري تربطي منطق التسجيل أو الانتقال للشاشة التالية لاحقاً
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFBF0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const GradLaunchHeaderBox(
                subtitle:
                    'Sign up to create job postings and discover candidtates.',
              ),
              const SizedBox(height: 24),
              CompanyFormFields(
                companyNameController: _companyNameController,
                emailController: _emailController,
                passwordController: _passwordController,
                obscurePassword: _obscurePassword,
                onTogglePassword: () {
                  setState(() => _obscurePassword = !_obscurePassword);
                },
              ),
              const SizedBox(height: 28),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: _onSignUpPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF3D250),
                    foregroundColor: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}