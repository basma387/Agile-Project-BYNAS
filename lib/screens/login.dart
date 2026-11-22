import 'package:bynas/theme/colors.dart';
import 'package:bynas/theme/textStyles.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.navy,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // --- TOP HEADER SECTION ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Button
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorManager.teal.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, color: ColorManager.gold, size: 18),
                      onPressed: () {
                        Navigator.pushNamed(context, '/splash');
                      },
                    ),
                  ),
                  // Center Logo
                  Container(
                    padding: const EdgeInsets.all(17),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: ColorManager.gold, width: 2),
                    ),
                    child: const Icon(Icons.school, color: ColorManager.gold, size: 60),
                  ),
                  // Student Badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: ColorManager.navy,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: ColorManager.gold),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: ColorManager.gold, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          "Student",
                          style: TextStyles.subtitleBlack.copyWith(
                            color: ColorManager.gold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // --- WELCOME TEXT SECTION ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 9),
                  // Welcome Back
                  Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyles.titleBlack.copyWith(color: Colors.white, fontSize: 32),
                      children: [
                        const TextSpan(text: "Welcome back, "),
                        TextSpan(
                          text: "trailblazer.",
                          style: TextStyle(color: ColorManager.gold),
                        ),
                      ],
                    ),
                  ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                  child: Text(
                    "Sign in to unlock paid internships & track applications.",
                    style: TextStyles.subtextGrey.copyWith(color: ColorManager.grey),
                  ),
                  ),
                ],
              ),
            ),

            // --- MAIN FORM CONTAINER ---
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
              child: Container(
                width: 850,
                decoration: const BoxDecoration(
                  color: ColorManager.beige,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black, 
                      offset: const Offset(0, 4), 
                      blurRadius: 0, 
                      spreadRadius: 6, 
                      ),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Account Login Header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "ACCOUNT LOGIN",
                              style: TextStyles.subtitleBlack.copyWith(
                                letterSpacing: 1.5,
                                fontSize: 18,
                                fontWeight:FontWeight.bold,
                              ),
                            ),
                            
                          ],
                        ),

                        Divider(color:ColorManager.teal, thickness:1, ),
                        const SizedBox(height: 24),

                        // Email Label
                        Text("Email or ID", style: TextStyles.subtitleBlack),
                        const SizedBox(height: 8),
                        
                        // Email Field
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(Icons.mail_outline, color: ColorManager.blue),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: ColorManager.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: ColorManager.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: ColorManager.blue, width: 2),
                            ),
                            hintText: "maya.chen@stanford.edu",
                            hintStyle: TextStyles.subtextBlue.copyWith(color: ColorManager.grey),
                          ),
                          style: TextStyles.subtextBlue.copyWith(color: ColorManager.navy),
                          validator: (value) => value == null || value.isEmpty ? 'Please enter your email' : null,
                        ),
                        const SizedBox(height: 20),

                        // Password Label & Forgot Password
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Password", style: TextStyles.subtitleBlack),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "Forgot password?",
                                style: TextStyles.subtextBlue.copyWith(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),

                        // Password Field
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(Icons.lock_outline, color: ColorManager.blue),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                color: ColorManager.blue,
                              ),
                              onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: ColorManager.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: ColorManager.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: ColorManager.blue, width: 2),
                            ),
                            hintText: "••••••••••••••••",
                            hintStyle: TextStyles.subtextBlue.copyWith(color: ColorManager.grey),
                          ),
                          style: TextStyles.subtextBlue.copyWith(color: ColorManager.navy),
                          validator: (value) => value == null || value.isEmpty ? 'Please enter your password' : null,
                        ),
                        const SizedBox(height: 24),

                        // Sign In Button
                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // TODO: Firebase Auth
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorManager.gold,
                              foregroundColor: ColorManager.navy,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: const BorderSide(color: ColorManager.navy, width: 1.5), // Hard shadow look
                              ),
                              elevation: 0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Sign In to Job Board",
                                  style: TextStyles.subtitleBlack.copyWith(
                                    fontSize: 16,
                                    color: ColorManager.navy,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(Icons.arrow_forward, color: ColorManager.navy),
                              ],
                            ),
                            
                          ),
                        ),
                        const SizedBox(height: 24),

                        // OR SSO Divider
                        Row(
                          children: [
                            Expanded(child: Divider(color: ColorManager.grey.withOpacity(0.5))),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "OR SO WITH",
                                style: TextStyles.subtextGrey.copyWith(
                                  color: ColorManager.blue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                            Expanded(child: Divider(color: ColorManager.grey.withOpacity(0.5))),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // SSO Buttons
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  side: BorderSide(color: ColorManager.grey),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.g_mobiledata, color: ColorManager.navy, size: 24),
                                    const SizedBox(width: 8),
                                    Text("Google", style: TextStyles.subtitleBlack),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  side: BorderSide(color: ColorManager.grey),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.work, color: ColorManager.blue, size: 20),
                                    const SizedBox(width: 8),
                                    Text("LinkedIn", style: TextStyles.subtitleBlack),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 40),

                        // Footer Sign Up
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "New to GradLaunch? ",
                                style: TextStyles.subtextGrey.copyWith(color: ColorManager.navy),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  "Create Student Profile",
                                  style: TextStyles.subtitleBlack.copyWith(
                                    color: ColorManager.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}