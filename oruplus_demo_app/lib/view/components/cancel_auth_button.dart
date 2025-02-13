import 'package:flutter/material.dart';
import 'package:oruplus_demo_app/view/home/home_screen.dart';

class CancelAuthButton extends StatelessWidget {
  const CancelAuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
          (route) => false,
        );
      },
      icon: const Icon(Icons.close),
    );
  }
}
