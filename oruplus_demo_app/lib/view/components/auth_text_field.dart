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
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                width: 1,
                color: CustomColors.redColor,
              ),
            ),
            errorStyle: const TextStyle(
              color: CustomColors.redColor,
              fontSize: 14,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
            ),
          ),
          validator: (value) {
            if (isPhoneNumberField && (value == null || value.length < 10)) {
              return "Please enter a valid phone number.";
            } else if (!isPhoneNumberField && value == null) {
              return "Please enter your name.";
            }
            return null;
          },
          keyboardType:
              isPhoneNumberField ? TextInputType.phone : TextInputType.name,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
