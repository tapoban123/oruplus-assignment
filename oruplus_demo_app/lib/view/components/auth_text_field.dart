import 'package:flutter/material.dart';
import 'package:oruplus_demo_app/utils/custom_colors.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController textController;
  final String titleText;
  final String hintText;
  final bool isPhoneNumberField;
  final Widget? richTitleText;
  const AuthTextField({
    super.key,
    required this.textController,
    required this.hintText,
    required this.titleText,
    this.richTitleText,
    this.isPhoneNumberField = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        richTitleText ??
            Text(
              titleText,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
        TextFormField(
          controller: textController,
          decoration: InputDecoration(
            prefixIcon: isPhoneNumberField
                ? const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "+91",
                        style: TextStyle(
                          fontSize: 16,
                          color: CustomColors.mediumGreyColor,
                        ),
                      ),
                    ],
                  )
                : null,
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 16,
              color: CustomColors.lightGreyColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                width: 1,
                color: CustomColors.lightGreyColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                width: 1,
                color: CustomColors.lightGreyColor,
              ),
            ),
          ),
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
