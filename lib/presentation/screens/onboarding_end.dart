import 'package:flutter/material.dart';
import 'package:novanews/core/widgets/onboarding_card.dart';
import 'package:novanews/presentation/screens/home_page.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/image/logo3.png", height: 40),
        actions: [TextButton(onPressed: () {}, child: const Text("Skip"))],
      ),
      body: Column(
        children: [
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
              activeDotColor: Color(0xFF002171),
              dotHeight: 7,
              dotWidth: 15,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
                backgroundColor: const Color(0xFF002171),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                );
              },
              child: const Text(
                "Continue to Feed",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
