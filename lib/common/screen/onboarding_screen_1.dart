import 'package:flutter/material.dart';
import 'package:inakal/common/widgets/onboardingpage.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen1 extends StatelessWidget {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.pinkWhiteGradient,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: AppColors.white,
            ),
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
            PageView(
              controller: _controller,
              children: [
                OnboardingPage(
                  image: 'assets/vectors/onboarding1.jpg',
                  title: 'Welcome to Inakal.com',
                  description:
                      'Find your life partner with care and confidence. Discover meaningful connections guided by our expert team.',
                ),
                OnboardingPage(
                   image: 'assets/vectors/onboarding2.jpg',
                  title: 'Tailored Matches',
                  description: 'We match you with like-minded individuals, making your journey to love seamless and personalized.',
                ),
                OnboardingPage(
                   image: 'assets/vectors/onboarding1.jpg',
                  title: 'Expert Guidance',
                  description: 'Get pre-marital counseling from professionals to build a strong, happy future together.',
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const WormEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  spacing: 8,
                  dotColor: AppColors.white,
                  activeDotColor:AppColors.primaryRed,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: TextButton(
                onPressed: () {
                  // Handle skip action
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: const Text('Skip'),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}

