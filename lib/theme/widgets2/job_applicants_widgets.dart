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

class JobApplicantsPalette {
  static const Color headerDark = Color(0xFF072128);
  static const Color creamBg = Color(0xFFF6F1D1);
  static const Color gold = Color(0xFFE5A437);
  static const Color tealText = Color(0xFF135C66);
  static const Color badgeSlate = Color(0xFF345E72);
  static const Color black = Color(0xFF0A0A0A);
  static const Color applicantCardBg = Color(0xFFF7E5C8);
  static const Color rejectRed = Color(0xFFE5243B);
}

class JobApplicantsHeader extends StatelessWidget {
  final VoidCallback onBackTap;
  final VoidCallback onProfileTap;

  const JobApplicantsHeader({
    super.key,
    required this.onBackTap,
    required this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 42, bottom: 20, left: 20, right: 20),
      decoration: const BoxDecoration(
        color: JobApplicantsPalette.headerDark,
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
            onTap: onBackTap,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: JobApplicantsPalette.headerDark,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white54, width: 1.2),
              ),
              child: const Icon(
                Icons.chevron_left,
                color: JobApplicantsPalette.gold,
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
                  color: JobApplicantsPalette.headerDark,
                  border: Border.all(
                    color: JobApplicantsPalette.gold,
                    width: 2.2,
                  ),
                ),
                child: const Icon(
                  Icons.school,
                  color: JobApplicantsPalette.gold,
                  size: 38,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Job Postings',
                style: TextStyle(
                  color: JobApplicantsPalette.gold,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: onProfileTap,
            borderRadius: BorderRadius.circular(14),
            child: Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: JobApplicantsPalette.badgeSlate,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: JobApplicantsPalette.gold,
                  width: 1.5,
                ),
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
}

class ApplicantActionPill extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color borderColor;
  final Color textColor;
  final bool isSelected;
  final Color activeFillColor;
  final VoidCallback onTap;

  const ApplicantActionPill({
    super.key,
    required this.label,
    required this.icon,
    required this.borderColor,
    required this.textColor,
    required this.isSelected,
    required this.activeFillColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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

class ApplicantTileCard extends StatelessWidget {
  final ApplicantItem applicant;
  final VoidCallback onCvTap;
  final ValueChanged<ApplicantStatus> onStatusSelected;

  const ApplicantTileCard({
    super.key,
    required this.applicant,
    required this.onCvTap,
    required this.onStatusSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: JobApplicantsPalette.applicantCardBg,
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
                  color: JobApplicantsPalette.applicantCardBg,
                  border: Border.all(
                    color: JobApplicantsPalette.gold,
                    width: 2.2,
                  ),
                ),
                child: const Icon(
                  Icons.person,
                  color: JobApplicantsPalette.headerDark,
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
                        color: JobApplicantsPalette.black,
                      ),
                    ),
                    const SizedBox(height: 2),
                    InkWell(
                      onTap: onCvTap,
                      child: Text(
                        applicant.cvUrl,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Courier',
                          fontSize: 12,
                          color: JobApplicantsPalette.tealText,
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
                child: ApplicantActionPill(
                  label: 'Accept',
                  icon: Icons.check,
                  borderColor: JobApplicantsPalette.tealText,
                  textColor: JobApplicantsPalette.tealText,
                  isSelected: applicant.status == ApplicantStatus.accepted,
                  activeFillColor: JobApplicantsPalette.tealText,
                  onTap: () => onStatusSelected(ApplicantStatus.accepted),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ApplicantActionPill(
                  label: 'Reject',
                  icon: Icons.close,
                  borderColor: JobApplicantsPalette.rejectRed,
                  textColor: JobApplicantsPalette.rejectRed,
                  isSelected: applicant.status == ApplicantStatus.rejected,
                  activeFillColor: JobApplicantsPalette.rejectRed,
                  onTap: () => onStatusSelected(ApplicantStatus.rejected),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ApplicantActionPill(
                  label: 'Shortlist',
                  icon: null,
                  borderColor: JobApplicantsPalette.black,
                  textColor: JobApplicantsPalette.black,
                  isSelected: applicant.status == ApplicantStatus.shortlisted,
                  activeFillColor: JobApplicantsPalette.black,
                  onTap: () => onStatusSelected(ApplicantStatus.shortlisted),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class JobApplicantsContainerCard extends StatelessWidget {
  final String jobTitle;
  final int newApplicantsCount;
  final List<ApplicantItem> applicants;
  final ValueChanged<String> onCvTap;
  final void Function(ApplicantItem applicant, ApplicantStatus status)
      onStatusAction;

  const JobApplicantsContainerCard({
    super.key,
    required this.jobTitle,
    required this.newApplicantsCount,
    required this.applicants,
    required this.onCvTap,
    required this.onStatusAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: JobApplicantsPalette.black, width: 2.2),
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
            jobTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Courier',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: JobApplicantsPalette.black,
            ),
          ),
          const SizedBox(height: 6),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$newApplicantsCount ',
                  style: const TextStyle(
                    color: Color(0xFFB57214),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const TextSpan(
                  text: 'New Applicants',
                  style: TextStyle(
                    color: JobApplicantsPalette.tealText,
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
          ...List.generate(applicants.length, (index) {
            final applicant = applicants[index];
            return Padding(
              padding: EdgeInsets.only(
                bottom: index == applicants.length - 1 ? 0 : 12,
              ),
              child: ApplicantTileCard(
                applicant: applicant,
                onCvTap: () => onCvTap(applicant.cvUrl),
                onStatusSelected: (status) => onStatusAction(applicant, status),
              ),
            );
          }),
        ],
      ),
    );
  }
}