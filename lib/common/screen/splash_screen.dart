import 'package:flutter/material.dart';
import 'package:inakal/common/screen/onboarding_screen_1.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller for fade effect
    _animationController = AnimationController(
      duration: Duration(seconds: 3), // Duration for the fade effect
      vsync: this,
    );

    // Create the fade animation for opacity
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Start the animation
    _animationController.forward();

    // Navigate to Onboarding screen after the animation
    _navigateToOnboarding();
  }

  _navigateToOnboarding() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => OnboardingScreen1())
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Center logo with fade effect
          Center(
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: Padding(
                padding: const EdgeInsets.all(100.0),
                child: Image.asset('assets/logo/inakal_logo.png'),
              ),
            ),
          ),
          // Heart pattern in bottom-right corner with fade effect
          Positioned(
            bottom: -100,
            right: -100,
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: Transform.rotate(
                angle: -45 * 3.1415927 / 180,
                child: Opacity(
                  opacity: 0.5,
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: Image.asset('assets/vectors/heart_pattern1.png'),
                  ),
                ),
              ),
            ),
          ),
          // Heart pattern in top-left corner with fade effect
          Positioned(
            top: -80,
            left: -80,
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: Transform.rotate(
                angle: 135 * 3.1415927 / 180,
                child: Opacity(
                  opacity: 0.5,
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset('assets/vectors/heart_pattern1.png'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
