import 'dart:async';
import 'package:flutter/material.dart';
import 'package:novanews/features/auth/presentation/screens/onboarding_end.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingData {
  final String title;
  final String description;
  final String image;
  OnboardingData({
    required this.title,
    required this.description,
    required this.image,
  });
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  Timer? _timer;
  int _currentIndex = 0;

  final List<OnboardingData> items = [
    OnboardingData(
      title: "Breaking News with NovaNews",
      description:
          "Never miss a headline. Get instant, real-time alerts on the most important stories happening around the globe, delivered right to your screen as they unfold.",
      image: "assets/image/breakingNews.jpg",
    ),
    OnboardingData(
      title: "Explore the\nFuture of Tech",
      description:
          "From revolutionary AI breakthroughs to the latest gadget reviews, we bring you the innovations that are shaping our future. Dive into the world of tomorrow, today.",
      image: "assets/image/Tec.jpg",
    ),
    OnboardingData(
      title: "Enjoy Every \n Sports Moment",
      description:
          "Your ultimate destination for live scores, match highlights, and in-depth analysis. Experience the adrenaline of the game and keep up with your favorite teams in one place.",
      image: "assets/image/sports2.jpg",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_pageController.hasClients) {
        int next = (_pageController.page?.toInt() ?? 0) + 1;
        if (next == items.length) next = 0;
        _pageController.animateToPage(
          next,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // استبدلنا الـ Stack بـ Column عشان الـ Expanded يشتغل صح
        children: [
          Expanded(
            // ده اللي بيمنع الـ Unbounded height
            child: PageView.builder(
              controller: _pageController,
              itemCount: items.length,
              onPageChanged: (index) => setState(() => _currentIndex = index),
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  // عشان لو الكلام طويل ميحصلش إيرور
                  child: Column(
                    children: [
                      const SizedBox(height: 80),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(14),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                items[index].image,
                                height: 300,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 30,
                            left: 30,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1e357a),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                "LIVE",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        items[index].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          items[index].description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Color(0xFF656566),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          SmoothPageIndicator(
            controller: _pageController,
            count: items.length,
            effect: const WormEffect(
              activeDotColor: Color(0xFF1e357a),
              dotHeight: 7,
              dotWidth: 15,
            ),
          ),

          const SizedBox(height: 40),

          if (_currentIndex == items.length - 1)
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Builder(
                builder: (innerContext) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 120,
                      vertical: 20,
                    ),
                    backgroundColor: const Color(0xFF1e357a),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      innerContext,
                      MaterialPageRoute(builder: (_) => const OnboardingEnd()),
                    );
                  },
                  child: const Text(
                    "Get Started",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
