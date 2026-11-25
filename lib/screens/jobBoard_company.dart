import 'package:flutter/material.dart';

class JobPostingModel {
  final String id;
  final String title;
  final int applicantsCount;

  const JobPostingModel({
    required this.id,
    required this.title,
    required this.applicantsCount,
  });
}

class JobBoardCompany extends StatefulWidget {
  const JobBoardCompany({super.key});

  @override
  State<JobBoardCompany> createState() => _JobBoardCompanyState();
}

class _JobBoardCompanyState extends State<JobBoardCompany> {
  
  static const Color _headerDark = Color(0xFF072128);
  static const Color _creamBg = Color(0xFFF6F1D1);
  static const Color _gold = Color(0xFFE5A437);
  static const Color _addBtnGold = Color(0xFFEBB754);
  static const Color _tealText = Color(0xFF135C66);
  static const Color _badgeSlate = Color(0xFF345E72);
  static const Color _black = Color(0xFF0A0A0A);

  final List<JobPostingModel> _jobs = [
    const JobPostingModel(
      id: '1',
      title: 'Frontend & Flutter Engineering Intern',
      applicantsCount: 3,
    ),
    const JobPostingModel(
      id: '2',
      title: 'Product Design (UI/UX) Intern',
      applicantsCount: 4,
    ),
  ];

 
  Future<void> _showAddJobDialog() async {
    final formKey = GlobalKey<FormState>();
    final titleController = TextEditingController();
    final applicantsController = TextEditingController(text: '0');

    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: _creamBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: _black, width: 2),
          ),
          title: const Text(
            'Add Job Posting',
            style: TextStyle(
              color: _headerDark,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: titleController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Job Title',
                    hintText: 'e.g. Flutter Mobile Intern',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    final text = value?.trim() ?? '';
                    if (text.isEmpty) {
                      return 'Please enter a job title';
                    }
                    if (text.length < 4) {
                      return 'Title must be at least 4 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: applicantsController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    labelText: 'New Applicants',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    final text = value?.trim() ?? '';
                    if (text.isEmpty) {
                      return 'Please enter applicants count';
                    }
                    final count = int.tryParse(text);
                    if (count == null || count < 0) {
                      return 'Enter a valid number (0 or more)';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (Navigator.canPop(dialogContext)) {
                  Navigator.pop(dialogContext);
                }
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _headerDark,
                foregroundColor: _gold,
              ),
              onPressed: () {
                if (!(formKey.currentState?.validate() ?? false)) {
                  return;
                }

                final newJob = JobPostingModel(
                  id: DateTime.now().microsecondsSinceEpoch.toString(),
                  title: titleController.text.trim(),
                  applicantsCount: int.parse(applicantsController.text.trim()),
                );

                setState(() {
                  _jobs.add(newJob);
                });

                if (dialogContext.mounted && Navigator.canPop(dialogContext)) {
                  Navigator.pop(dialogContext);
                }

                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Job posting added successfully'),
                      backgroundColor: _tealText,
                    ),
                  );
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );

    titleController.dispose();
    applicantsController.dispose();
  }

  
  void _handleBack() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You are already on Job Postings')),
      );
    }
  }

  void _openJobDetails(JobPostingModel job) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => _JobPostingDetailsView(job: job),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _creamBg,
      body: Column(
        children: [
          
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 44, bottom: 22, left: 20, right: 20),
            decoration: const BoxDecoration(
              color: _headerDark,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                InkWell(
                  onTap: _handleBack,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: _headerDark,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white54, width: 1.2),
                    ),
                    child: const Icon(
                      Icons.chevron_left,
                      color: _gold,
                      size: 26,
                    ),
                  ),
                ),

                
                Column(
                  children: [
                    Container(
                      width: 74,
                      height: 74,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _headerDark,
                        border: Border.all(color: _gold, width: 2.2),
                      ),
                      child: const Icon(
                        Icons.school,
                        color: _gold,
                        size: 40,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Job Postings',
                      style: TextStyle(
                        color: _gold,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),

                
                InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Profile: SM')),
                    );
                  },
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: _badgeSlate,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: _gold, width: 1.5),
                    ),
                    child: const Text(
                      'SM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

        
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Select a job posting to view applicants',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Courier',
                color: _tealText,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Divider(color: Colors.black38, thickness: 1.2, height: 1),
          ),

          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: _showAddJobDialog,
                child: Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: _addBtnGold,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: _black, width: 1.8),
                    boxShadow: const [
                      BoxShadow(
                        color: _black,
                        offset: Offset(0, 4),
                        blurRadius: 0,
                      ),
                    ],
                  ),
                  child: const Icon(Icons.add, color: _black, size: 28),
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                padding: const EdgeInsets.only(bottom: 24),
                itemCount: _jobs.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,
                  childAspectRatio: 0.92,
                ),
                itemBuilder: (context, index) {
                  final job = _jobs[index];
                  return Container(
                    padding: const EdgeInsets.fromLTRB(18, 20, 18, 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: _black, width: 2.2),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black38,
                          offset: Offset(0, 5),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          job.title,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: 'Courier',
                            fontSize: 16,
                            height: 1.25,
                            fontWeight: FontWeight.w700,
                            color: _black,
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${job.applicantsCount} ',
                                style: const TextStyle(
                                  color: Color(0xFFB57214),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const TextSpan(
                                text: 'New Applicants',
                                style: TextStyle(
                                  color: _tealText,
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            const Divider(
                              color: Colors.black26,
                              thickness: 1.2,
                              height: 14,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () => _openJobDetails(job),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Details',
                                      style: TextStyle(
                                        color: _tealText,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: _tealText,
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _JobPostingDetailsView extends StatelessWidget {
  final JobPostingModel job;

  const _JobPostingDetailsView({required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _JobBoardCompanyState._creamBg,
      appBar: AppBar(
        backgroundColor: _JobBoardCompanyState._headerDark,
        foregroundColor: _JobBoardCompanyState._gold,
        title: const Text('Job Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: _JobBoardCompanyState._black, width: 2),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                job.title,
                style: const TextStyle(
                  fontFamily: 'Courier',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: _JobBoardCompanyState._black,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '${job.applicantsCount} New Applicants',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: _JobBoardCompanyState._tealText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}