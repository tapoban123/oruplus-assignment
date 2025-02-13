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

class LoginModel extends BaseViewModel {}

class Login extends StackedView<LoginModel> {
  const Login({super.key});

  @override
  Widget builder(BuildContext context, LoginModel viewModel, Widget? child) {
    // TODO: implement builder
    throw UnimplementedError();
  }

  @override
  LoginModel viewModelBuilder(BuildContext context) {
    // TODO: implement viewModelBuilder
    throw UnimplementedError();
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneNumbercontroller = TextEditingController();
  late GlobalKey<FormState> _formKey;
  final AuthRepository _authRepository = AuthRepository();

  @override
  void initState() {
    _formKey = GlobalKey();
    super.initState();
  }

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
            ViewModelBuilder.nonReactive(
              viewModelBuilder: () =>
                  OtpCreateViewModel(authRepository: _authRepository),
              builder: (context, viewModel, child) => AuthButton(
                buttonText: "Next",
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).push(pageNavigationAnimation(
                      context,
                      navigateWidget: const OtpScreen(),
                    ));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
