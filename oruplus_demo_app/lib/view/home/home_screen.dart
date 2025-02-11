import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oruplus_demo_app/data/app_data.dart';
import 'package:oruplus_demo_app/model/feature_model.dart';
import 'package:oruplus_demo_app/utils/app_media_paths.dart';
import 'package:oruplus_demo_app/utils/custom_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 150,
        leading: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Image.asset(AppMediaPaths.drawerIcon),
            ),
            SizedBox(
              height: 30,
              child: Image.asset(AppMediaPaths.oruLogoImage),
            ),
          ],
        ),
        actions: [
          const Text(
            "India",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          Image.asset(AppMediaPaths.locationIconIcon),
          const SizedBox(
            width: 14,
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: CustomColors.yellowColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              minimumSize: const Size(66, 29),
            ),
            child: const Text(
              "Login",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: CustomColors.blackColor,
              ),
            ),
          ),
          const SizedBox(
            width: 14,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide:
                        const BorderSide(color: CustomColors.lightGreyColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide:
                        const BorderSide(color: CustomColors.lightGreyColor)),
                hintText: "Search phones with make, model...",
                prefixIcon: Image.asset(AppMediaPaths.searchIcon),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 1.8,
                      height: 20,
                      color: CustomColors.mediumGreyColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                        height: 24, child: Image.asset(AppMediaPaths.micIcon)),
                  ],
                ),
              ),
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: featuresList.length,
                itemBuilder: (context, index) {
                  return FeatureWidget(
                    feature: featuresList[index],
                  );
                },
              ),
            ),
            BannerDislpay(),
            const Text("What's on your mind?"),
            const Text("Top brands"),
            const Text("Best deals in India")
          ],
        ),
      ),
    );
  }
}

class BannerDislpay extends StatefulWidget {
  const BannerDislpay({super.key});

  @override
  State<BannerDislpay> createState() => _BannerDislpayState();
}

class _BannerDislpayState extends State<BannerDislpay> {
  ValueNotifier<int> currentBannerNumber = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
            onPageChanged: (index, reason) {
              currentBannerNumber.value = index;
            },
          ),
          items: [
            Image.asset(AppMediaPaths.banner1),
            Image.asset(AppMediaPaths.banner2),
            Image.asset(AppMediaPaths.banner3),
            Image.asset(AppMediaPaths.banner4),
            Image.asset(AppMediaPaths.banner5),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            5,
            (index) => Padding(
              padding: const EdgeInsets.all(1.0),
              child: ValueListenableBuilder(
                valueListenable: currentBannerNumber,
                builder: (context, bannerNumberValue, child) =>
                    AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: CustomColors.lightGreyColor),
                    color: bannerNumberValue == index
                        ? CustomColors.lightGreyColor
                        : Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FeatureWidget extends StatelessWidget {
  final FeatureModel feature;
  const FeatureWidget({
    super.key,
    required this.feature,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Chip(
        color:
            WidgetStatePropertyAll(Theme.of(context).scaffoldBackgroundColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: CustomColors.lightGreyColor),
        ),
        label: Row(
          children: [
            feature.isNew
                ? Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Container(
                      height: 13,
                      width: 23,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xff6565F1),
                            Color(0xffB152E9),
                            Color(0xffE9489D),
                          ],
                        ),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "new",
                        style: TextStyle(
                          fontSize: 6.8,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            Text(
              feature.feature,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: CustomColors.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
