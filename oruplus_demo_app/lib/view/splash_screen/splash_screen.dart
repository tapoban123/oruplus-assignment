import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:oruplus_demo_app/utils/app_media_paths.dart';
import 'package:oruplus_demo_app/utils/commons.dart';
import 'package:oruplus_demo_app/view/auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();

    _controller.addListener(
      () {
        if (_controller.isCompleted) {
          debugPrint("Completed Animation");

          Navigator.of(context).pushAndRemoveUntil(
            pageNavigationAnimation(
              context,
              navigateWidget: const LoginScreen(),
            ),
            (route) => false,
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LottieBuilder.asset(
          controller: _controller,
          AppMediaPaths.splashScreenGif,
          onLoaded: (animation) {
            _controller.duration = animation.duration;

            _controller.forward();
          },
        ),
      ),
    );
  }
}
