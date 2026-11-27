import 'package:flutter/material.dart';

class CompanyFormFields extends StatelessWidget {
  final TextEditingController companyNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool obscurePassword;
  final VoidCallback onTogglePassword;

  const CompanyFormFields({
    super.key,
    required this.companyNameController,
    required this.emailController,
    required this.passwordController,
    this.obscurePassword = true,
    required this.onTogglePassword,
  });

  Widget _buildFieldLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String hint, {Widget? suffixIcon}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
      filled: true,
      fillColor: Colors.white,
      suffixIcon: suffixIcon,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.black, width: 1.6),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildFieldLabel('Company Name'),
        TextFormField(
          controller: companyNameController,
          textInputAction: TextInputAction.next,
          decoration: _buildInputDecoration('Name'),
        ),
        const SizedBox(height: 18),
        _buildFieldLabel('Company Email'),
        TextFormField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: _buildInputDecoration('Email'),
        ),
        const SizedBox(height: 18),
        _buildFieldLabel('Create password'),
        TextFormField(
          controller: passwordController,
          obscureText: obscurePassword,
          textInputAction: TextInputAction.done,
          decoration: _buildInputDecoration(
            'Password',
            suffixIcon: IconButton(
              onPressed: onTogglePassword,
              icon: Icon(
                obscurePassword ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey.shade600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}