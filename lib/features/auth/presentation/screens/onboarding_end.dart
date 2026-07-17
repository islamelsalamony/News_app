import 'package:flutter/material.dart';
import 'package:novanews/core/cache/cache_user_repo.dart';
import 'package:novanews/core/theme/app_colors.dart';
import 'package:novanews/core/theme/app_images.dart';
import 'package:novanews/core/widgets/custom_buttom.dart';
import 'package:novanews/core/widgets/onboarding_card.dart';
import 'package:novanews/features/auth/presentation/screens/login_screen.dart';
import 'package:novanews/features/home/presentations/screens/home_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingEnd extends StatefulWidget {
  const OnboardingEnd({super.key});
  @override
  State<OnboardingEnd> createState() => _OnboardingEndState();
}

class _OnboardingEndState extends State<OnboardingEnd> {
  final PageController _pageController = PageController();
  // ignore: unused_field
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = CacheUserRepo.isLoggedIn();
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AppImage.logo3, height: 40),
        actions: [TextButton(onPressed: () {}, child: const Text("Skip"))],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImage.backgroundBlue),

            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // 1. استخدام Expanded يحل مشكلة الـ Unbounded height
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) => setState(() => _currentIndex = index),
                children: const [
                  OnboardingPageContent(
                    title: "No Noise, Just Facts.",
                    description:
                        "Stop scrolling through endless feeds. We bring you the distilled truth of every story, verified and delivered without the clutter.",
                    imagePath: "assets/image/noise.jpg",
                    badgeText: "Curation Excellence",
                  ),
                  OnboardingPageContent(
                    title: "Master the Digital Shift.",
                    description:
                        "Technology is moving fast—don't get left behind. We simplify complex tech trends into easy-to-read insights for your daily life.",
                    imagePath: "assets/image/shift.jpg",
                    badgeText: "Tech Insights",
                  ),
                  OnboardingPageContent(
                    title: "Your Game, Your Rules.",
                    description:
                        "Get straight to the scores and stats that matter. Follow your favorite leagues with a clean, ad-free experience that respects your time.",
                    imagePath: "assets/image/game.jpg",
                    badgeText: "Sports Hub",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: const WormEffect(
                activeDotColor: AppColors.primaryBlue,
                dotHeight: 7,
                dotWidth: 15,
              ),
            ),

            const SizedBox(height: 20),

            // 2. استخدام Builder يضمن عمل الـ Navigator بدون مشاكل
            Builder(
              builder: (innerContext) => Padding(
                padding: const EdgeInsets.all(24.0),
                child: CustomButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            isLoggedIn ? const HomeScreen() : LoginScreen(),
                      ),
                    );
                  },
                  text: "Continue to Feed",
                  radius: 12,
                  color: AppColors.primaryBlue,
                  style: TextStyle(color: AppColors.white, fontSize: 25),
                ),
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     minimumSize: const Size(double.infinity, 60),
                //     backgroundColor: const Color(0xFF002171),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(12),
                //     ),
                //   ),
                //   onPressed: () {
                //     Navigator.pushReplacement(
                //       innerContext,
                //       MaterialPageRoute(builder: (_) => const HomeScreen()),
                //     );
                //   },
                //   child: const Text(
                //     "Continue to Feed",
                //     style: TextStyle(color: Colors.white, fontSize: 25),
                //   ),
                // ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
