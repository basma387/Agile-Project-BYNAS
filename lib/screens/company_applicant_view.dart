import 'package:flutter/material.dart';

enum ApplicantStatus { none, accepted, rejected, shortlisted }

class ApplicantItem {
  final String id;
  final String name;
  final String cvUrl;
  final String timeAgo;
  ApplicantStatus status;

  ApplicantItem({
    required this.id,
    required this.name,
    required this.cvUrl,
    required this.timeAgo,
    this.status = ApplicantStatus.none,
  });
}

class JobApplicantsViewScreen extends StatefulWidget {
  final String jobTitle;
  final int newApplicantsCount;
  final List<ApplicantItem>? initialApplicants;

  const JobApplicantsViewScreen({
    super.key,
    this.jobTitle = 'Product Design (UI/UX) Intern',
    this.newApplicantsCount = 4,
    this.initialApplicants,
  });

  @override
  State<JobApplicantsViewScreen> createState() => _JobApplicantsViewScreenState();
}

class _JobApplicantsViewScreenState extends State<JobApplicantsViewScreen> {
  static const Color _headerDark = Color(0xFF072128);
  static const Color _creamBg = Color(0xFFF6F1D1);
  static const Color _gold = Color(0xFFE5A437);
  static const Color _tealText = Color(0xFF135C66);
  static const Color _badgeSlate = Color(0xFF345E72);
  static const Color _black = Color(0xFF0A0A0A);
  static const Color _applicantCardBg = Color(0xFFF7E5C8);
  static const Color _rejectRed = Color(0xFFE5243B);

  late final List<ApplicantItem> _applicants;

  @override
  void initState() {
    super.initState();
    _applicants = widget.initialApplicants ??
        [
          ApplicantItem(
            id: '1',
            name: 'Jane Doe',
            cvUrl: 'https://www.CVLink.com',
            timeAgo: '2h',
          ),
          ApplicantItem(
            id: '2',
            name: 'John Smith',
            cvUrl: 'https://www.CVLink.com',
            timeAgo: '4h',
          ),
        ];
  }

  void _handleBack() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      _showSnack('أنتِ بالفعل على شاشة Job Postings');
    }
  }

  void _handleStatusAction(ApplicantItem applicant, ApplicantStatus targetStatus) {
    final index = _applicants.indexWhere((item) => item.id == applicant.id);
    if (index == -1) return;

    final currentStatus = _applicants[index].status;

    if (currentStatus == targetStatus) {
      _showSnack('${applicant.name} تم تحديد حالته بالفعل');
      return;
    }

    setState(() {
      _applicants[index].status = targetStatus;
    });

    final label = switch (targetStatus) {
      ApplicantStatus.accepted => 'Accepted',
      ApplicantStatus.rejected => 'Rejected',
      ApplicantStatus.shortlisted => 'Shortlisted',
      ApplicantStatus.none => 'Updated',
    };

    _showSnack('${applicant.name} → $label');
  }

  void _handleCvTap(String url) {
    final trimmed = url.trim();
    if (trimmed.isEmpty) {
      _showSnack('رابط السيرة الذاتية غير متاح');
      return;
    }
    _showSnack('CV Link: $trimmed');
  }

  void _showSnack(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: _headerDark,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _creamBg,
      body: Column(
        children: [
          _buildTopHeader(),
          const SizedBox(height: 16),
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
            child: Divider(
              color: Colors.black38,
              thickness: 1.2,
              height: 1,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
              child: _buildJobApplicantsBox(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 42, bottom: 20, left: 20, right: 20),
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
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _headerDark,
                  border: Border.all(color: _gold, width: 2.2),
                ),
                child: const Icon(
                  Icons.school,
                  color: _gold,
                  size: 38,
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
            onTap: () => _showSnack('Profile: SM'),
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
    );
  }

  Widget _buildJobApplicantsBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
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
        children: [
          Text(
            widget.jobTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Courier',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: _black,
            ),
          ),
          const SizedBox(height: 6),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${widget.newApplicantsCount} ',
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
          const Divider(
            color: Colors.black26,
            thickness: 1.2,
            height: 18,
          ),
          ...List.generate(_applicants.length, (index) {
            final applicant = _applicants[index];
            return Padding(
              padding: EdgeInsets.only(
                bottom: index == _applicants.length - 1 ? 0 : 12,
              ),
              child: _buildApplicantCard(applicant),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildApplicantCard(ApplicantItem applicant) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _applicantCardBg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _applicantCardBg,
                  border: Border.all(color: _gold, width: 2.2),
                ),
                child: const Icon(
                  Icons.person,
                  color: _headerDark,
                  size: 26,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      applicant.name,
                      style: const TextStyle(
                        fontFamily: 'Courier',
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: _black,
                      ),
                    ),
                    const SizedBox(height: 2),
                    InkWell(
                      onTap: () => _handleCvTap(applicant.cvUrl),
                      child: Text(
                        applicant.cvUrl,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Courier',
                          fontSize: 12,
                          color: _tealText,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 6),
              Text(
                applicant.timeAgo,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildActionPillButton(
                  label: 'Accept',
                  icon: Icons.check,
                  borderColor: _tealText,
                  textColor: _tealText,
                  isSelected: applicant.status == ApplicantStatus.accepted,
                  activeFillColor: _tealText,
                  onTap: () => _handleStatusAction(
                    applicant,
                    ApplicantStatus.accepted,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildActionPillButton(
                  label: 'Reject',
                  icon: Icons.close,
                  borderColor: _rejectRed,
                  textColor: _rejectRed,
                  isSelected: applicant.status == ApplicantStatus.rejected,
                  activeFillColor: _rejectRed,
                  onTap: () => _handleStatusAction(
                    applicant,
                    ApplicantStatus.rejected,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildActionPillButton(
                  label: 'Shortlist',
                  icon: null,
                  borderColor: _black,
                  textColor: _black,
                  isSelected: applicant.status == ApplicantStatus.shortlisted,
                  activeFillColor: _black,
                  onTap: () => _handleStatusAction(
                    applicant,
                    ApplicantStatus.shortlisted,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionPillButton({
    required String label,
    required IconData? icon,
    required Color borderColor,
    required Color textColor,
    required bool isSelected,
    required Color activeFillColor,
    required VoidCallback onTap,
  }) {
    final backgroundColor = isSelected ? activeFillColor : Colors.transparent;
    final foregroundColor = isSelected ? Colors.white : textColor;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 30,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: borderColor, width: 1.5),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 14, color: foregroundColor),
                const SizedBox(width: 3),
              ],
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: foregroundColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}