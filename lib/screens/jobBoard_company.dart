import 'package:flutter/material.dart';
import 'company_applicant_view.dart';

/// ------------------------------------------------------------
/// Colors
/// ------------------------------------------------------------
class AppColors {
  static const navy = Color(0xFF0A1D24);
  static const gold = Color(0xFFE5A23D);
  static const cream = Color(0xFFF6EFD2);
  static const teal = Color(0xFF0B5057);
  static const avatarBg = Color(0xFF365B67);
  static const avatarText = Color(0xFFFFF1D0);
  static const backBorder = Color(0xFFE8E0C8);
  static const buttonGold = Color(0xFFF2C572);
  static const numberBrown = Color(0xFFA8701F);
  static const divider = Color(0xFF9B9784);
  static const black = Colors.black;
  static const white = Colors.white;
}

/// ------------------------------------------------------------
/// Model
/// ------------------------------------------------------------
class JobPosting {
  final String title;
  final int newApplicants;

  const JobPosting({required this.title, required this.newApplicants});
}

/// ------------------------------------------------------------
/// Screen
/// ------------------------------------------------------------
class JobBoardCompany extends StatelessWidget {
  const JobBoardCompany({super.key});

  static const List<JobPosting> _jobs = [
    JobPosting(title: 'Frontend & Flutter Engineering Intern', newApplicants: 3),
    JobPosting(title: 'Product Design (UI/UX) Intern', newApplicants: 4),
  ];

  static const double _sidePadding = 42;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: Column(
        children: [
          // "<" button -> previous page
          JobPostingsHeader(
            title: 'Job Postings',
            initials: 'SM',
            onBack: () => Navigator.maybePop(context),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                        _sidePadding, 18, _sidePadding, 0),
                    child: Column(
                      children: [
                        Text(
                          'Select a job posting to view applicants',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: 'monospace', 
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: AppColors.teal,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: AppColors.divider,
                        ),
                        const SizedBox(height: 22),
                        // "+" button -> form screen
                        Align(
                          alignment: Alignment.centerRight,
                          child: AddButton(
                            onTap: () => Navigator.pushNamed(context, '/form'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(
                      _sidePadding, 40, _sidePadding, 32),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 520,
                      mainAxisSpacing: 36,
                      crossAxisSpacing: 108,
                      mainAxisExtent: 225,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final job = _jobs[index];
                        return JobPostingCard(
                          job: job,
                                                   onDetails: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => JobApplicantsViewScreen(
                                  jobTitle: job.title,
                                  newApplicantsCount: job.newApplicants,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      childCount: _jobs.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// ------------------------------------------------------------
/// Header (dark navy, rounded bottom corners)
/// ------------------------------------------------------------
class JobPostingsHeader extends StatelessWidget {
  final String title;
  final String initials;
  final VoidCallback onBack;

  const JobPostingsHeader({
    super.key,
    required this.title,
    required this.initials,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final double top = MediaQuery.of(context).padding.top;

    return Container(
      width: double.infinity,
      height: 205 + top,
      decoration: const BoxDecoration(
        color: AppColors.navy,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
      ),
      child: Stack(
        children: [
          // Back button
          Positioned(
            left: 42,
            top: top + 75,
            child: GestureDetector(
              onTap: onBack,
              child: Container(
                width: 58,
                height: 54,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.backBorder, width: 1),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 22,
                  color: AppColors.gold,
                ),
              ),
            ),
          ),

          // Avatar
          Positioned(
            right: 42,
            top: top + 48,
            child: Container(
              width: 86,
              height: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.avatarBg,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.gold, width: 1.5),
              ),
              child: Text(
                initials,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: AppColors.avatarText,
                ),
              ),
            ),
          ),

          // Logo + title (centered)
          Positioned(
            top: top + 14,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  width: 116,
                  height: 116,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.gold, width: 2),
                  ),
                  child: const Icon(
                    Icons.school_rounded,
                    size: 60,
                    color: AppColors.gold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w700,
                    color: AppColors.gold,
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// ------------------------------------------------------------
/// "+" button
/// ------------------------------------------------------------
class AddButton extends StatelessWidget {
  final VoidCallback onTap;

  const AddButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 62,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.buttonGold,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.black, width: 2.5),
          boxShadow: const [
            BoxShadow(
              color: AppColors.black,
              offset: Offset(2, 4),
              blurRadius: 0,
            ),
          ],
        ),
        child: const Icon(Icons.add, size: 38, color: AppColors.black),
      ),
    );
  }
}

/// ------------------------------------------------------------
/// Job posting card
/// ------------------------------------------------------------
class JobPostingCard extends StatelessWidget {
  final JobPosting job;
  final VoidCallback onDetails;

  const JobPostingCard({
    super.key,
    required this.job,
    required this.onDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(28, 34, 28, 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: AppColors.black, width: 2.5),
        boxShadow: const [
          BoxShadow(
            color: AppColors.black,
            offset: Offset(2, 6),
            blurRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 280),
            child: Text(
              job.title,
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'monospace', 
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: AppColors.black,
                height: 1.35,
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${job.newApplicants}',
                  style: TextStyle(fontFamily: 'monospace', 
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: AppColors.numberBrown,
                  ),
                ),
                TextSpan(
                  text: ' New Applicants',
                  style: TextStyle(fontFamily: 'monospace', 
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                    color: AppColors.teal,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          const Divider(height: 1, thickness: 1, color: AppColors.divider),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: onDetails,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Details',
                    style: TextStyle(fontFamily: 'monospace', 
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: AppColors.teal,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.arrow_forward_rounded,
                    size: 15,
                    color: AppColors.teal,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// ------------------------------------------------------------
/// Placeholder form screen (replace with your own)
/// ------------------------------------------------------------