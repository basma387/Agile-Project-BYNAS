import 'package:flutter/material.dart';

class JobBoardColors {
  static const Color headerDark = Color(0xFF072128);
  static const Color creamBg = Color(0xFFF6F1D1);
  static const Color gold = Color(0xFFE5A437);
  static const Color addBtnGold = Color(0xFFEBB754);
  static const Color tealText = Color(0xFF135C66);
  static const Color badgeSlate = Color(0xFF345E72);
  static const Color black = Color(0xFF0A0A0A);
}

class JobBoardHeader extends StatelessWidget {
  final VoidCallback onBackTap;
  final VoidCallback onProfileTap;

  const JobBoardHeader({
    super.key,
    required this.onBackTap,
    required this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 44, bottom: 22, left: 20, right: 20),
      decoration: const BoxDecoration(
        color: JobBoardColors.headerDark,
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
                color: JobBoardColors.headerDark,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white54, width: 1.2),
              ),
              child: const Icon(
                Icons.chevron_left,
                color: JobBoardColors.gold,
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
                  color: JobBoardColors.headerDark,
                  border: Border.all(color: JobBoardColors.gold, width: 2.2),
                ),
                child: const Icon(
                  Icons.school,
                  color: JobBoardColors.gold,
                  size: 40,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Job Postings',
                style: TextStyle(
                  color: JobBoardColors.gold,
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
                color: JobBoardColors.badgeSlate,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: JobBoardColors.gold, width: 1.5),
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

class AddJobButton extends StatelessWidget {
  final VoidCallback onTap;

  const AddJobButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          color: JobBoardColors.addBtnGold,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: JobBoardColors.black, width: 1.8),
          boxShadow: const [
            BoxShadow(
              color: JobBoardColors.black,
              offset: Offset(0, 4),
              blurRadius: 0,
            ),
          ],
        ),
        child: const Icon(Icons.add, color: JobBoardColors.black, size: 28),
      ),
    );
  }
}

class JobPostingCard extends StatelessWidget {
  final String title;
  final int applicantsCount;
  final VoidCallback onDetailsTap;

  const JobPostingCard({
    super.key,
    required this.title,
    required this.applicantsCount,
    required this.onDetailsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 20, 18, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: JobBoardColors.black, width: 2.2),
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
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: 'Courier',
              fontSize: 16,
              height: 1.25,
              fontWeight: FontWeight.w700,
              color: JobBoardColors.black,
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$applicantsCount ',
                  style: const TextStyle(
                    color: Color(0xFFB57214),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const TextSpan(
                  text: 'New Applicants',
                  style: TextStyle(
                    color: JobBoardColors.tealText,
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
                  onTap: onDetailsTap,
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Details',
                        style: TextStyle(
                          color: JobBoardColors.tealText,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.arrow_forward,
                        color: JobBoardColors.tealText,
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
  }
}