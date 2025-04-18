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
  double progressValue = 0.0; // 25% — can update this from API later
  double? newValue = 0.0;

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

    fetchProgress();

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> fetchProgress() async {
    await AuthService().getProfileCompletionStatus(context).then((value) {
      setState(() {
        newValue = value! / 100 ?? 0.0;
      });
    });
    updateProgress(newValue!);
    // print("${newValue}");
  }

  // Optional: Function to update progress from API later
  void updateProgress(double newValue) {
    setState(() {
      progressValue = newValue;
      _animation = Tween<double>(begin: _animation.value, end: progressValue)
          .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
      _controller
        ..reset()
        ..forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => EditProfile()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: Card(
            color: AppColors.primaryRed,
            clipBehavior: Clip.hardEdge,
            child: Stack(
              children: [
                // Decorative heart patterns
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
                        child: Image.asset('assets/vectors/heart_pattern1.png'),
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
                        child: Image.asset('assets/vectors/heart_pattern1.png'),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 30.0),
                  child: Row(
                    children: [
                      // Smooth animated progress
                      AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          double percentage =
                              (_animation.value * 100).clamp(0, 100);

                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                height: 65,
                                width: 65,
                                child: CircularProgressIndicator(
                                  value: _animation.value,
                                  strokeWidth: 7,
                                  backgroundColor:
                                      AppColors.white.withOpacity(0.2),
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                          AppColors.white),
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
                      const Expanded(
                        child: Text(
                          "Complete your profile to help us find your perfect match. A detailed profile leads to better connections!",
                          style: TextStyle(
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
          ),
        ),
      ),
    );
  }
}
