import 'package:bynas/theme/colors.dart';
import 'package:bynas/theme/textStyles.dart';
import 'package:flutter/material.dart';
import 'form.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.beige,
      body: Stack(
        children: [
          // 1. The Dotted Background Pattern
          Positioned.fill(child: CustomPaint(painter: DotPatternPainter())),

          // 2. The Main Content
          SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // --- TOP HEADER (Navy Background) ---
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 10, bottom: 60),
                    // Extra bottom padding for the logo overlap
                    decoration: const BoxDecoration(
                      color: ColorManager.navy,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      children: [
                        // Top Badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: ColorManager.navy,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: ColorManager.gold),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star,
                                color: ColorManager.gold,
                                size: 14,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                "CAMPUS CAREER LAUNCHPAD",
                                style: TextStyles.subtitleBlack.copyWith(
                                  color: ColorManager.gold,
                                  fontSize: 10,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // --- CENTER LOGO SECTION ---
                  // We use a Transform to pull it up so it overlaps the navy header and the beige body
                  Transform.translate(
                    offset: const Offset(0, -45),
                    child: Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorManager.beige, // Matches the background
                        border: Border.all(color: ColorManager.gold, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: ColorManager.gold.withOpacity(0.3),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      // Inner circle for the logo
                      child: Center(
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorManager.blue,
                          ),
                          child: const Icon(
                            Icons.school,
                            color: Colors.white,
                            size: 45,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // --- TEXT SECTION ---
                  // Pulled up slightly to close the gap left by the Transform
                  Transform.translate(
                    offset: const Offset(0, -20),
                    child: Column(
                      children: [
                        Text(
                          "GRADLAUNCH • CLASS OF '26 & '27",
                          style: TextStyles.subtextBlue.copyWith(
                            color: ColorManager.teal,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Real internships.",
                          style: TextStyles.titleBlack.copyWith(
                            fontSize: 32,
                            height: 1.1,
                          ),
                        ),
                        Text(
                          "Zero fluff.",
                          style: TextStyles.titleBlack.copyWith(
                            fontSize: 32,
                            color: ColorManager.darkBlue,
                            height: 1.1,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            "Verified paid roles, direct recruiter drops, and fair stipends built exclusively for students.",
                            textAlign: TextAlign.center,
                            style: TextStyles.subtextGrey.copyWith(
                              color: ColorManager.navy.withOpacity(0.7),
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // --- STATS CARD SECTION ---
                  Transform.translate(
                    offset: const Offset(0, -10),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildStatItem("100%", "Paid Roles"),
                            Container(
                              width: 1,
                              height: 30,
                              color: ColorManager.grey.withOpacity(0.5),
                            ),
                            _buildStatItem("48 hrs", "Avg. Reply"),
                            Container(
                              width: 1,
                              height: 30,
                              color: ColorManager.grey.withOpacity(0.5),
                            ),
                            _buildStatItem(
                              "Verified",
                              "Admin Checked",
                              isGold: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                  // Pushes the buttons to the bottom

                  // --- BOTTOM BUTTONS SECTION ---
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 20,
                    ),
                    child: Column(
                      children: [
                        // Sign Up Button (Solid Navy)
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorManager.darkBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Sign Up as Student ",
                                  style: TextStyles.subtitleBlack.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward,
                                  color: ColorManager.gold,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),

                        // Login Button (Outlined)
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 55,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: const BorderSide(
                                color: ColorManager.navy,
                                width: 1.5,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.login,
                                  color: ColorManager.navy,
                                  size: 18,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "Login to Job Board",
                                  style: TextStyles.subtitleBlack.copyWith(
                                    color: ColorManager.navy,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),

                        // Employer Button (Solid Gold)
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FormScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorManager.gold,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.business,
                                  color: ColorManager.navy,
                                  size: 18,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "Make a Post (Employers)",
                                  style: TextStyles.subtitleBlack.copyWith(
                                    color: ColorManager.navy,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for the stats row
  Widget _buildStatItem(String value, String label, {bool isGold = false}) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyles.subtitleBlack.copyWith(
            fontSize: 14,
            color: isGold ? ColorManager.gold : ColorManager.navy,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyles.subtextGrey.copyWith(
            fontSize: 10,
            color: ColorManager.blue,
          ),
        ),
      ],
    );
  }
}

// Custom Painter to draw the subtle dot matrix background
class DotPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ColorManager.grey
          .withOpacity(0.4) // Subtle dots
      ..style = PaintingStyle.fill;

    const double spacing = 20.0; // Distance between dots
    const double radius = 1.0; // Size of the dots

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
