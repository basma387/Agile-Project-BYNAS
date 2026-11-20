import 'package:flutter/material.dart';
import 'package:bynas/theme/colors.dart';
import 'package:bynas/theme/textStyles.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final _formKey = GlobalKey<FormState>();

  final _companyController = TextEditingController();
  final _titleController = TextEditingController();
  final _countryController = TextEditingController();

  final _descriptionController = TextEditingController();
  final _requirementsController = TextEditingController();

  final _durationController = TextEditingController();
  String? _arrangement;
  String? _workHours;

  final _deadlineController = TextEditingController();
  String _compensation = 'Paid';

  bool _isSubmitted = false;

  final _createdPosts = [];

  @override
  void dispose() {
    _pageController.dispose();
    _companyController.dispose();
    _titleController.dispose();
    _countryController.dispose();
    _descriptionController.dispose();
    _requirementsController.dispose();
    _durationController.dispose();
    _deadlineController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_formKey.currentState!.validate()) {
      if (_currentPage < 3) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newPost = {
        'company': _companyController.text.trim(),
        'title': _titleController.text.trim(),
        'country': _countryController.text.trim(),
        'description': _descriptionController.text.trim(),
        'requirements': _requirementsController.text.trim(),
        'duration': _durationController.text.trim(),
        'arrangement': _arrangement,
        'workHours': _workHours,
        'deadline': _deadlineController.text.trim(),
        'compensation': _compensation,
      };

      setState(() {
        _createdPosts.add(newPost);
        _isSubmitted = true;
      });
    }
  }

  void _startNewForm() {
    setState(() {
      _isSubmitted = false;
      _currentPage = 0;
      _arrangement = null;
      _workHours = null;
      _compensation = 'Paid';

      _companyController.clear();
      _titleController.clear();
      _countryController.clear();
      _descriptionController.clear();
      _requirementsController.clear();
      _durationController.clear();
      _deadlineController.clear();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_pageController.hasClients) {
        _pageController.jumpToPage(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.navy,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 16),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: ColorManager.gold, width: 2),
                    ),
                    child: const Icon(Icons.school, color: ColorManager.gold, size: 30),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: ColorManager.navy,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: ColorManager.gold),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.star, color: ColorManager.gold, size: 12),
                            const SizedBox(width: 4),
                            Text(
                              "Company",
                              style: TextStyles.subtextGrey.copyWith(
                                color: ColorManager.gold,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: ColorManager.gold,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Go To Job Board",
                          style: TextStyles.subtitleBlack.copyWith(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: RichText(
                text: TextSpan(
                  style: TextStyles.titleBlack.copyWith(color: Colors.white, fontSize: 24),
                  children: [
                    const TextSpan(text: "Post a New "),
                    TextSpan(text: "Opportunity", style: TextStyle(color: ColorManager.gold)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Fill in the details below for the job post.",
              style: TextStyles.subtextGrey.copyWith(color: Colors.white70),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorManager.beige,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.black, width: 2),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 6),
                        blurRadius: 0,
                      ),
                    ],
                  ),
                  child: _isSubmitted ? _buildSuccessView() : _buildFormView(),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildFormView() {
    return Form(
      key: _formKey,
      child: Stack(
        children: [
          PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              _buildPage1(),
              _buildPage2(),
              _buildPage3(),
              _buildPage4(),
            ],
          ),
          if (_currentPage > 0)
            Positioned(
              left: 10,
              top: 0,
              bottom: 0,
              child: Center(
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, color: ColorManager.gold, size: 30),
                  onPressed: _previousPage,
                ),
              ),
            ),
          if (_currentPage < 3)
            Positioned(
              right: 10,
              top: 0,
              bottom: 0,
              child: Center(
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, color: ColorManager.gold, size: 30),
                  onPressed: _nextPage,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPage1() {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTextField(
              label: "Company Name",
              hint: "Company Name",
              controller: _companyController,
              validatorMessage: "Please enter the company name",
            ),
            const SizedBox(height: 20),
            _buildTextField(
              label: "Job/Internship Title",
              hint: "Job Title",
              controller: _titleController,
              validatorMessage: "Please enter the job title",
            ),
            const SizedBox(height: 20),
            _buildTextField(
              label: "Country",
              hint: "Country",
              controller: _countryController,
              validatorMessage: "Please enter the country",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage2() {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTextField(
              label: "Description",
              hint: "Write job description...",
              controller: _descriptionController,
              maxLines: 3,
              validatorMessage: "Please enter the job description",
            ),
            const SizedBox(height: 20),
            _buildTextField(
              label: "Requirements",
              hint: "Write job requirements...",
              controller: _requirementsController,
              maxLines: 3,
              validatorMessage: "Please enter the job requirements",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage3() {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTextField(
              label: "Duration",
              hint: "Ex: 12 weeks",
              controller: _durationController,
              validatorMessage: "Please enter the duration",
            ),
            const SizedBox(height: 20),
            _buildDropdown(
              label: "Arrangement",
              value: _arrangement,
              items: ['Remote', 'On-site', 'Hybrid'],
              validatorMessage: "Please select an arrangement",
              onChanged: (val) => setState(() => _arrangement = val),
            ),
            const SizedBox(height: 20),
            _buildDropdown(
              label: "Work Hours",
              value: _workHours,
              items: ['Full-time', 'Part-time', 'Flexible'],
              validatorMessage: "Please select work hours",
              onChanged: (val) => setState(() => _workHours = val),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage4() {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTextField(
              label: "Application Deadline",
              hint: "dd/mm/yyyy",
              controller: _deadlineController,
              keyboardType: TextInputType.datetime,
              validatorMessage: "Please enter the application deadline",
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Compensation", style: TextStyles.subtitleBlack),
            ),
            Row(
              children: [
                Radio<String>(
                  value: 'Paid',
                  groupValue: _compensation,
                  activeColor: ColorManager.blue,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => _compensation = val);
                    }
                  },
                ),
                Text("Paid", style: TextStyles.subtextBlue.copyWith(color: ColorManager.navy)),
                const SizedBox(width: 20),
                Radio<String>(
                  value: 'Unpaid',
                  groupValue: _compensation,
                  activeColor: ColorManager.blue,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => _compensation = val);
                    }
                  },
                ),
                Text("Unpaid", style: TextStyles.subtextBlue.copyWith(color: ColorManager.navy)),
              ],
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 4),
                      blurRadius: 0,
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.gold,
                    foregroundColor: ColorManager.navy,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(color: Colors.black, width: 1.5),
                    ),
                  ),
                  child: Text("Create Post", style: TextStyles.titleBlack.copyWith(fontSize: 18)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessView() {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Post Created",
            style: TextStyles.titleBlack.copyWith(
              color: ColorManager.darkBlue,
              fontSize: 32,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "Total created posts: ${_createdPosts.length}",
            style: TextStyles.subtextBlue.copyWith(color: ColorManager.navy),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: ColorManager.darkBlue, width: 2),
            ),
            child: const Icon(Icons.check, color: ColorManager.darkBlue, size: 60),
          ),
          const SizedBox(height: 50),
          SizedBox(
            width: double.infinity,
            height: 55,
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 4),
                    blurRadius: 0,
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: ElevatedButton(
                onPressed: _startNewForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.gold,
                  foregroundColor: ColorManager.navy,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: Colors.black, width: 1.5),
                  ),
                ),
                child: Text(
                  "Create Another Post",
                  style: TextStyles.titleBlack.copyWith(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required String validatorMessage,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyles.subtitleBlack),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return validatorMessage;
            }
            return null;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: hint,
            hintStyle: TextStyles.subtextGrey.copyWith(color: Colors.grey.shade400),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.black, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: ColorManager.blue, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required String validatorMessage,
    required void Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyles.subtitleBlack),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          initialValue: value,
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
          validator: (val) {
            if (val == null || val.isEmpty) {
              return validatorMessage;
            }
            return null;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.black, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: ColorManager.blue, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
          ),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item, style: TextStyles.subtextBlue.copyWith(color: ColorManager.navy)),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}