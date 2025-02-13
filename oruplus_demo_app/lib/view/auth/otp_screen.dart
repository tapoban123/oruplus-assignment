import 'dart:async';

import 'package:flutter/material.dart';
import 'package:oruplus_demo_app/model/auth/auth_repository.dart';
import 'package:oruplus_demo_app/utils/app_media_paths.dart';
import 'package:oruplus_demo_app/utils/custom_colors.dart';
import 'package:oruplus_demo_app/view/auth/sign_up_screen.dart';
import 'package:oruplus_demo_app/view/components/auth_button.dart';
import 'package:oruplus_demo_app/view/components/cancel_auth_button.dart';
import 'package:oruplus_demo_app/view_model/auth/auth_view_model.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:stacked/stacked.dart';

class OTPScreen extends StackedView<AuthViewModel> {
  final int phoneNumber;
  OTPScreen({
    super.key,
    required this.phoneNumber,
  });

  final ValueNotifier<int> timerValue = ValueNotifier(23);
  Timer? timer;
  final AuthRepository _authRepository = AuthRepository();
  final TextEditingController _otpController = TextEditingController();

  @override
  AuthViewModel viewModelBuilder(BuildContext context) =>
      AuthViewModel(authRepository: _authRepository);

  void createTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (timer.tick == 24) {
          timer.cancel();
        } else {
          timerValue.value -= 1;
        }
      },
    );
  }

  @override
  Widget builder(BuildContext context, AuthViewModel viewModel, Widget? child) {
    // @override
    // void initState() {
    //   super.initState();
    // }

    // @override
    // void dispose() {
    //   timer.cancel();
    //   super.dispose();
    // }

    createTimer();

    return Scaffold(
        appBar: AppBar(
          actions: const [
            CancelAuthButton(),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  AppMediaPaths.oruLogoImage,
                  height: 100,
                ),
                const Text(
                  "Verify Mobile No.",
                  style: TextStyle(
                    fontSize: 28,
                    color: CustomColors.blueColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        "Please enter the 4 digital verification code sent to your mobile number ",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: CustomColors.mediumGreyColor,
                      fontFamily: "Poppins",
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "+91-$phoneNumber",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(text: " via "),
                      const TextSpan(
                        text: "SMS",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                SizedBox(
                  width: 198,
                  height: 44,
                  child: PinInputTextField(
                    controller: _otpController,
                    pinLength: 4,
                    decoration: BoxLooseDecoration(
                      strokeColorBuilder:
                          const FixedColorBuilder(CustomColors.lightGreyColor),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Column(
                  children: [
                    const Text(
                      "Didn't receive OTP?",
                      style: TextStyle(
                        color: CustomColors.mediumGreyColor,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const Text(
                            "Resend OTP",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        ValueListenableBuilder(
                          valueListenable: timerValue,
                          builder: (context, value, child) => Text(
                              " in 0:${((value % 10) - value) == 0 ? "0$value" : value} Sec"),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    AuthButton(
                      buttonText: "Verify OTP",
                      onTap: () async {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                        try {
                          await viewModel.validateOTP(
                            countryCode: 91,
                            phoneNumber: phoneNumber,
                            otp: int.parse(_otpController.text),
                          );
                          if (context.mounted) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ));
                          }
                        } catch (e) {
                          debugPrint(e.toString());
                        }
                      },
                      noArrow: true,
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
