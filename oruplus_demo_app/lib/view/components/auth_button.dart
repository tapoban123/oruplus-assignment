import 'package:flutter/material.dart';
import 'package:oruplus_demo_app/utils/custom_colors.dart';

class AuthButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final bool noArrow;
  const AuthButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.noArrow = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        backgroundColor: CustomColors.blueColor,
        minimumSize: const Size(double.infinity, 51),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            buttonText,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: CustomColors.whiteColor,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          noArrow
              ? const SizedBox.shrink()
              : const Icon(
                  Icons.arrow_forward,
                  color: CustomColors.whiteColor,
                  size: 20,
                )
        ],
      ),
    );
  }
}
