import 'package:flutter/material.dart';
import 'package:oruplus_demo_app/utils/app_media_paths.dart';
import 'package:oruplus_demo_app/utils/commons.dart';
import 'package:oruplus_demo_app/utils/custom_colors.dart';
import 'package:oruplus_demo_app/view/auth/otp_screen.dart';
import 'package:oruplus_demo_app/view/components/accepts_terms_checkbox.dart';
import 'package:oruplus_demo_app/view/components/auth_button.dart';
import 'package:oruplus_demo_app/view/components/auth_text_field.dart';
import 'package:oruplus_demo_app/view/components/cancel_auth_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneNumbercontroller = TextEditingController();

  @override
  void dispose() {
    phoneNumbercontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          CancelAuthButton(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              AppMediaPaths.oruLogoImage,
              height: 100,
            ),
            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 28,
                color: CustomColors.blueColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              "Sign in to continue",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: CustomColors.mediumGreyColor),
            ),
            const SizedBox(
              height: 100,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthTextField(
                  textController: phoneNumbercontroller,
                  hintText: "Mobile Number",
                  titleText: "Enter your Phone Number",
                  isPhoneNumberField: true,
                ),
              ],
            ),
            const SizedBox(
              height: 120,
            ),
            const AcceptsTermsCheckbox(),
            AuthButton(
              buttonText: "Next",
              onTap: () {
                Navigator.of(context).push(pageNavigationAnimation(
                  context,
                  navigateWidget: const OtpScreen(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
