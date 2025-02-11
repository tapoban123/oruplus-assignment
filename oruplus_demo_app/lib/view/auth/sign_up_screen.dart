import 'package:flutter/material.dart';
import 'package:oruplus_demo_app/utils/app_media_paths.dart';
import 'package:oruplus_demo_app/utils/custom_colors.dart';
import 'package:oruplus_demo_app/view/components/auth_button.dart';
import 'package:oruplus_demo_app/view/components/auth_text_field.dart';
import 'package:oruplus_demo_app/view/components/cancel_auth_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();

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
              "SignUp to continue",
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
                  textController: nameController,
                  hintText: "Name",
                  titleText: "Please Tell Us Your Name *",
                  richTitleText: RichText(
                    text: const TextSpan(
                      text: "Please Tell Us Your Name ",
                      style: TextStyle(
                        color: CustomColors.blackColor,
                        fontFamily: "Poppins",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: "*",
                          style: TextStyle(color: CustomColors.redColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 120,
            ),
            AuthButton(
              buttonText: "Confirm Name",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
