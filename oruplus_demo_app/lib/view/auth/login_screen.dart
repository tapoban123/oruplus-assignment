import 'package:flutter/material.dart';
import 'package:oruplus_demo_app/model/auth/auth_repository.dart';
import 'package:oruplus_demo_app/utils/app_media_paths.dart';
import 'package:oruplus_demo_app/utils/commons.dart';
import 'package:oruplus_demo_app/utils/custom_colors.dart';
import 'package:oruplus_demo_app/view/auth/otp_screen.dart';
import 'package:oruplus_demo_app/view/components/accepts_terms_checkbox.dart';
import 'package:oruplus_demo_app/view/components/auth_button.dart';
import 'package:oruplus_demo_app/view/components/auth_text_field.dart';
import 'package:oruplus_demo_app/view/components/cancel_auth_button.dart';
import 'package:oruplus_demo_app/view_model/auth/auth_view_model.dart';
import 'package:stacked/stacked.dart';

class LoginScreen extends StackedView<AuthViewModel> {
  LoginScreen({super.key});
  final AuthRepository _authRepository = AuthRepository();
  final TextEditingController phoneNumbercontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  AuthViewModel viewModelBuilder(BuildContext context) =>
      AuthViewModel(authRepository: _authRepository);

  @override
  Widget builder(BuildContext context, AuthViewModel viewModel, Widget? child) {
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
              Form(
                key: _formKey,
                child: Column(
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
              ),
              const SizedBox(
                height: 120,
              ),
              const AcceptsTermsCheckbox(),
              AuthButton(
                buttonText: "Next",
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    if (viewModel.isBusy) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    await viewModel.createOtp(
                      countryCode: 91,
                      mobileNumber: int.parse(phoneNumbercontroller.text),
                    );
                    if (viewModel.hasError == false &&
                        viewModel.isBusy == false) {
                      if (context.mounted) {
                        Navigator.of(context).push(pageNavigationAnimation(
                          context,
                          navigateWidget: OTPScreen(
                            phoneNumber: int.parse(phoneNumbercontroller.text),
                          ),
                        ));
                      }
                    } else {
                      debugPrint(viewModel.error({}).toString());
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
