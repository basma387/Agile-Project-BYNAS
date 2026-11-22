import 'package:bynas/theme/colors.dart';
import 'package:flutter/material.dart';


// FormScreen: Screen for creating a new job post
class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  // GlobalKey used to manage form validation
  final formKey = GlobalKey<FormState>();

  // Controllers used to retrieve user input
  final companyNameController = TextEditingController();
  final jobDescriptionController = TextEditingController();
  final requirementsController = TextEditingController();
  final deadlineController = TextEditingController();

  // Dispose controllers to release resources
  @override
  void dispose() {
    companyNameController.dispose();
    jobDescriptionController.dispose();
    requirementsController.dispose();
    deadlineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Screen background color
      backgroundColor:ColorManager.beige,

      // Top navigation bar
      appBar: AppBar(
        backgroundColor:ColorManager.beige,
        elevation: 0,

        // Back button to return to the previous screen
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: ColorManager.darkBlue,
          ),
          onPressed: () => Navigator.pop(context),
        ),

        // Screen title
        title: const Text(
          'Create Job Post',
          style: TextStyle(
            color: ColorManager.darkBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // SafeArea prevents content from overlapping system UI
      body: SafeArea(
        child: SingleChildScrollView(
          // Add padding around the form content
          padding: const EdgeInsets.all(24),

          child: Form(
            // Connect the form with the GlobalKey
            key: formKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                // Job-related icon
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: ColorManager.blue.withOpacity(0.12),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.work_outline_rounded,
                      size: 45,
                      color: ColorManager.blue,
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                // Main heading
                const Text(
                  'Post a New Opportunity',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.darkBlue,
                  ),
                ),

                const SizedBox(height: 6),

                // Subtitle
                const Text(
                  'Fill in the details below for the job post.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorManager.grey,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 30),

                // 1. Company Name Field
                TextFormField(
                  controller: companyNameController,
                  decoration: _inputDecoration(
                    'Company Name',
                    'Enter company name',
                    Icons.business_outlined,
                  ),

                  // Validate that the company name is not empty
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter the company name';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // 2. Job Description Field
                TextFormField(
                  controller: jobDescriptionController,
                  maxLines: 3,
                  decoration: _inputDecoration(
                    'Job Description',
                    'Describe the role and responsibilities',
                    Icons.description_outlined,
                  ),

                  // Validate that the job description is not empty
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter the job description';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // 3. Requirements Field
                TextFormField(
                  controller: requirementsController,
                  maxLines: 3,
                  decoration: _inputDecoration(
                    'Requirements',
                    'List the required skills',
                    Icons.list_alt_rounded,
                  ),

                  // Validate that the requirements field is not empty
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter the requirements';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // 4. Deadline Field
                TextFormField(
                  controller: deadlineController,
                  decoration: _inputDecoration(
                    'Deadline',
                    'e.g. 2026-12-31',
                    Icons.calendar_today_outlined,
                  ),

                  // Validate that the deadline is not empty
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter the deadline';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 35),

                // 5. Submit Button
                SizedBox(
                  height: 52,
                  child: ElevatedButton(


                    onPressed: () {

                      // Check if all form fields are valid
                      if (formKey.currentState!.validate()) {

                        // Display success message when validation passes
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Job Post Submitted Successfully!',
                            ),
                            backgroundColor: ColorManager.darkBlue,
                          ),
                        );
                      }
                    },

                    // Submit button styling
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.darkBlue,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    child: const Text(
                      'Submit Post',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to create a consistent style for all input fields
  InputDecoration _inputDecoration(
      String label,
      String hint,
      IconData icon,
      ) {
    return InputDecoration(

      labelText: label,

      hintText: hint,

      // Prefix icon
      prefixIcon: Icon(
        icon,
        color: ColorManager.blue,
      ),

      filled: true,
      fillColor: Colors.white,

      // Default border style
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: ColorManager.grey,
        ),
      ),

      // Border style when the field is enabled
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: ColorManager.grey.withOpacity(0.6),
        ),
      ),

      // Border style when the field is focused
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: ColorManager.darkBlue,
          width: 2,
        ),
      ),
    );
  }
}