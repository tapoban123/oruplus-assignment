import 'package:flutter/material.dart';
import 'package:oruplus_demo_app/utils/custom_colors.dart';

class AcceptsTermsCheckbox extends StatefulWidget {
  const AcceptsTermsCheckbox({super.key});

  @override
  State<AcceptsTermsCheckbox> createState() => _AcceptsTermsCheckboxState();
}

class _AcceptsTermsCheckboxState extends State<AcceptsTermsCheckbox> {
  ValueNotifier<bool> isChecked = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: isChecked,
          builder: (context, isCheckedValue, child) => Checkbox(
            value: isCheckedValue,
            side: const BorderSide(color: CustomColors.lightGreyColor),
            activeColor: CustomColors.darkGreyColor,
            onChanged: (value) {
              isChecked.value = value ?? false;
            },
          ),
        ),
        RichText(
          text: const TextSpan(
            text: "Accept ",
            style: TextStyle(
              color: CustomColors.blackColor,
              fontSize: 14,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
            ),
            children: <TextSpan>[
              TextSpan(
                text: "Terms and condition",
                style: TextStyle(
                  color: CustomColors.blueColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
