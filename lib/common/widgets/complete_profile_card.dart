import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/auth/service/auth_service.dart';
import 'package:inakal/features/drawer/screens/edit_profile.dart';

class CompleteProfileCard extends StatefulWidget {
  const CompleteProfileCard({super.key});

  @override
  State<CompleteProfileCard> createState() => _CompleteProfileCardState();
}

class _CompleteProfileCardState extends State<CompleteProfileCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<Color?> _colorAnimation;
  double progressValue = 0.0;
  double? newValue = 0.0;
  bool isVisible = true;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: progressValue).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _colorAnimation = ColorTween(
      begin: AppColors.primaryRed,
      end: AppColors.primaryRed,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    fetchProgress();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> fetchProgress() async {
    await AuthService().getProfileCompletionStatus(context).then((value) {
      setState(() {
        newValue = (value ?? 0);
      });
    }).then((value) => updateProgress(newValue ?? 0.0));
    if (newValue == 100)
      await Future.delayed(Duration(seconds: 3)).then((onValue) => setState(() {
            isVisible = false;
          }));
  }

  void updateProgress(double newValue) {
    setState(() {
      progressValue = newValue;
      print(newValue);

      _animation = Tween<double>(
        begin: _animation.value,
        end: progressValue,
      ).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOut),
      );

      _colorAnimation = ColorTween(
        begin: AppColors.primaryRed,
        end: newValue == 100 ? Colors.green : AppColors.primaryRed,
      ).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
      );

      _controller
        ..reset()
        ..forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return isVisible
        ? GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfile()),
              );
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Card(
                      color: _colorAnimation.value ?? AppColors.blue,
                      clipBehavior: Clip.hardEdge,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 40,
                            right: 40,
                            child: Transform.rotate(
                              angle: 10 * 3.1415927 / 180,
                              child: Opacity(
                                opacity: 0.5,
                                child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Image.asset(
                                      'assets/vectors/heart_pattern2.png'),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -35,
                            right: -35,
                            child: Transform.rotate(
                              angle: -45 * 3.1415927 / 180,
                              child: Opacity(
                                opacity: 0.5,
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Image.asset(
                                      'assets/vectors/heart_pattern2.png'),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 30.0),
                            child: Row(
                              children: [
                                AnimatedBuilder(
                                  animation: _animation,
                                  builder: (context, child) {
                                    double percentage =
                                        (_animation.value).clamp(0, 100);
                                    return Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        SizedBox(
                                          height: 65,
                                          width: 65,
                                          child: CircularProgressIndicator(
                                            value: _animation.value / 100,
                                            strokeWidth: 7,
                                            backgroundColor: AppColors.white
                                                .withAlpha((255 * 0.2).round()),
                                            valueColor:
                                                const AlwaysStoppedAnimation<
                                                    Color>(AppColors.white),
                                          ),
                                        ),
                                        Text(
                                          "${percentage.toInt()}%",
                                          style: const TextStyle(
                                            color: AppColors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Text(
                                    progressValue == 100
                                        ? "Successfully completed your profile details."
                                        : "Complete your profile to help us find your perfect match. A detailed profile leads to better connections!",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        : SizedBox.shrink();
  }
}
