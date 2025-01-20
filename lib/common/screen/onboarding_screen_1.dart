import 'package:flutter/material.dart';
import 'package:inakal/common/widgets/onboardingpage.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen1 extends StatefulWidget {
  @override
  _OnboardingScreen1State createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> onboardingPages = [
      const OnboardingPage(
        image: 'assets/vectors/onboarding1.jpg',
        title: 'Welcome to Inakal.com',
        description:
            'Find your life partner with care and confidence. Discover meaningful connections guided by our expert team.',
      ),
      const OnboardingPage(
        image: 'assets/vectors/onboarding2.jpg',
        title: 'Tailored Matches',
        description:
            'We match you with like-minded individuals, making your journey to love seamless and personalized.',
      ),
      const OnboardingPage(
        image: 'assets/vectors/onboarding1.jpg',
        title: 'Expert Guidance',
        description:
            'Get pre-marital counseling from professionals to build a strong, happy future together.',
      ),
      const OnboardingPage(
        image: 'assets/vectors/onboarding3.jpg',
        title: 'Discover Love where your story begins.',
        description:
            'Join us to discover your ideal partner and ignite the sparks of romance in your journey.',
      ),
    ];

    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.pinkWhiteGradient,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            // Background container
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: AppColors.white,
            ),

            // Gradient at the bottom
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                decoration: const BoxDecoration(
                  gradient: AppColors.pinkWhiteGradient,
                ),
              ),
            ),

            // PageView for onboarding content
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: PageView(
                controller: _controller,
                children: onboardingPages,
              ),
            ),

            // Page indicator
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: onboardingPages.length,
                  effect: const WormEffect(
                    dotHeight: 12,
                    dotWidth: 12,
                    spacing: 8,
                    dotColor: AppColors.white,
                    activeDotColor: AppColors.primaryRed,
                  ),
                ),
              ),
            ),

            // Logo at the top center
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Image.asset(
                  'assets/logo/inakal_logo.png',
                  height: 100,
                  width: 100,
                ),
              ),
            ),

            // Skip button, hidden on the last page
            if (_currentPage < onboardingPages.length - 1)
              Positioned(
                bottom: 20,
                right: 20,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
