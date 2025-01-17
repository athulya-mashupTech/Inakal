import 'package:flutter/material.dart';
import 'package:inakal/common/screen/onboarding_screen_1.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  _navigateToOnboarding() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => OnboardingScreen1())
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(100.0),
              child: Image.asset('assets/logo/inakal_logo.png'),
            ),
          ),
          Positioned(
            bottom: -100,
            right: -100,
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
          Positioned(
            top: -80,
            left: -80,
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
        ],
      ),
    );
  }
}
