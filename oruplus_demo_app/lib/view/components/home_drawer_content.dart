import 'package:flutter/material.dart';
import 'package:oruplus_demo_app/utils/app_media_paths.dart';
import 'package:oruplus_demo_app/utils/custom_colors.dart';
import 'package:oruplus_demo_app/view/auth/login_screen.dart';

class HomeDrawerContent extends StatelessWidget {
  const HomeDrawerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: double.infinity,
      backgroundColor: CustomColors.whiteColor,
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              height: 48,
              color: CustomColors.extraLightGreyColor,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AppMediaPaths.oruLogoImage,
                    height: 20,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  DrawerButton(
                    buttonColor: CustomColors.blueColor,
                    buttonText: "Login/SignUp",
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                        (route) => false,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DrawerButton(
                    buttonColor: CustomColors.yellowColor,
                    buttonText: "Sell Your Phone",
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const Spacer(),
            Column(
              children: [
                Row(
                  children: [],
                ),
                Row(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final VoidCallback onTap;

  const DrawerButton({
    super.key,
    required this.buttonColor,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          elevation: 5.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          minimumSize: const Size(double.infinity, 43)),
      child: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: CustomColors.whiteColor,
        ),
      ),
    );
  }
}
