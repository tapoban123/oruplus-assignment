import 'package:flutter/material.dart';
import 'package:oruplus_demo_app/utils/commons.dart';
import 'package:oruplus_demo_app/view/home/home_screen.dart';

class CancelAuthButton extends StatelessWidget {
  const CancelAuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pushReplacement(pageNavigationAnimation(
          context,
          begin: const Offset(0, -1),
          end: Offset.zero,
          navigateWidget: const HomeScreen(),
        ));
      },
      icon: const Icon(Icons.close),
    );
  }
}
