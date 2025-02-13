import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:oruplus_demo_app/data/app_data.dart';
import 'package:oruplus_demo_app/data_model/brand_model.dart';
import 'package:oruplus_demo_app/data_model/faq_model.dart';
import 'package:oruplus_demo_app/data_model/other_models.dart';
import 'package:oruplus_demo_app/data_model/product_model.dart';
import 'package:oruplus_demo_app/model/home/home_repository.dart';
import 'package:oruplus_demo_app/utils/app_media_paths.dart';
import 'package:oruplus_demo_app/utils/custom_colors.dart';
import 'package:oruplus_demo_app/view/auth/login_screen.dart';
import 'package:oruplus_demo_app/view/components/home_drawer_content.dart';
import 'package:oruplus_demo_app/view_model/home/home_view_model.dart';
import 'package:social_sharing_plus/social_sharing_plus.dart';
import 'package:stacked/stacked.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ValueNotifier<bool> isUserScrollingDown = ValueNotifier(false);
  late ScrollController _scrollController;
  late GlobalKey<ScaffoldState> _homeScaffoldKey;
  late HomeRepository _homeRepository;

  @override
  void initState() {
    _scrollController = ScrollController();
    _homeScaffoldKey = GlobalKey<ScaffoldState>();
    _homeRepository = HomeRepository();

    super.initState();

    _scrollController.addListener(
      () {
        if (_scrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
          isUserScrollingDown.value = false;
        } else {
          isUserScrollingDown.value = true;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _homeScaffoldKey,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ValueListenableBuilder(
        valueListenable: isUserScrollingDown,
        builder: (context, isUserScrollingDownValue, child) {
          if (isUserScrollingDownValue) {
            return const SizedBox.shrink();
          }
          return Container(
            width: 105,
            height: 51,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(44),
                color: CustomColors.darkColor,
                border: Border.all(
                  width: 4,
                  color: CustomColors.yellowColor,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 8,
                    spreadRadius: 0.5,
                    offset: const Offset(1.5, 4),
                  )
                ]),
            alignment: Alignment.center,
            child: const Row(mainAxisSize: MainAxisSize.min, children: [
              Text(
                "Sell",
                style: TextStyle(
                  color: CustomColors.yellowColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.add,
                size: 24,
                color: CustomColors.yellowColor,
              ),
            ]),
          );
        },
      ),
      drawer: const HomeDrawerContent(),
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              pinned: false,
              floating: true,
              automaticallyImplyLeading: false,
              backgroundColor: CustomColors.whiteColor.withOpacity(0.5),
              shape: InputBorder.none,
              title: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Builder(
                          builder: (context) => IconButton(
                            onPressed: () {
                              _homeScaffoldKey.currentState?.openDrawer();
                            },
                            icon: Image.asset(AppMediaPaths.drawerIcon),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: Image.asset(AppMediaPaths.oruLogoImage),
                        ),
                      ],
                    ),
                    Row(
                      children: [
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
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                              (route) => false,
                            );
                          },
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
                    )
                  ],
                ),
              ),
            ),
            SliverAppBar(
              pinned: true,
              toolbarHeight: 110,
              automaticallyImplyLeading: false,
              backgroundColor: CustomColors.whiteColor.withOpacity(0.7),
              title: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: CustomColors.whiteColor,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: const BorderSide(
                                color: CustomColors.lightGreyColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: const BorderSide(
                                color: CustomColors.lightGreyColor)),
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
                                height: 24,
                                child: Image.asset(AppMediaPaths.micIcon)),
                          ],
                        ),
                      ),
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
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
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              sliver: SliverList(
                  delegate: SliverChildListDelegate(
                [
                  const BannerDislpay(),
                  const Text(
                    "What's on your mind?",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 170,
                    child: ListView.builder(
                      itemCount: onYourMindContentData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: SizedBox(
                          height: 110,
                          width: 90,
                          child: Column(
                            children: [
                              Image.asset(
                                onYourMindContentData[index].imgPath,
                                fit: BoxFit.contain,
                              ),
                              Text(
                                onYourMindContentData[index].title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top brands",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Icon(CupertinoIcons.right_chevron)
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const TopBrandsList(),
                  const SizedBox(
                    height: 34,
                  ),
                  RichText(
                    text: const TextSpan(
                      text: "Best deals ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Poppins",
                        color: CustomColors.blackColor,
                      ),
                      children: [
                        TextSpan(
                          text: "in India",
                          style: TextStyle(color: CustomColors.blueColor),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 84,
                        height: 36,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: CustomColors.lightGreyColor),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(AppMediaPaths.sortIcon),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "Sort",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              CupertinoIcons.chevron_down,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ViewModelBuilder.reactive(
                    viewModelBuilder: () => FetchAllProductsViewModel(
                        homeRepository: _homeRepository),
                    builder: (context, viewModel, child) {
                      if (viewModel.isBusy) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final products = viewModel.data as List<ProductModel>;

                      return GridView.builder(
                        itemCount: products.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 3.2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ItemCard(
                            productData: products[index],
                          );
                        },
                      );
                    },
                  ),
                ],
              )),
            ),
            const SliverToBoxAdapter(child: FaqsDisplay()),
            const SliverToBoxAdapter(child: BottomShareWidget()),
          ],
        ),
      ),
    );
  }
}

class FaqsDisplay extends StatefulWidget {
  const FaqsDisplay({super.key});

  @override
  State<FaqsDisplay> createState() => _FaqsDisplayState();
}

class _FaqsDisplayState extends State<FaqsDisplay> {
  late HomeRepository _homeRepository;

  @override
  void initState() {
    _homeRepository = HomeRepository();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Frequently Asked Questions",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Icon(
                  CupertinoIcons.chevron_right,
                  size: 20,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          ViewModelBuilder.reactive(
            viewModelBuilder: () =>
                GetFaqViewModel(homeRepository: _homeRepository),
            builder: (context, viewModel, child) {
              if (viewModel.isBusy) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final faq = viewModel.data as List<FaqModel>;

              return ListView.builder(
                shrinkWrap: true,
                itemCount: faq.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return FAQExpansionTile(
                    faqData: faq[index],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class BottomShareWidget extends StatelessWidget {
  const BottomShareWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 222,
              width: 390,
              color: CustomColors.yellowColor,
            ),
            Positioned(
              top: 49,
              child: Column(
                children: [
                  const SizedBox(
                    width: 300,
                    child: Text(
                      "Get Notified About Our Latest Offers and Price Drops",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        height: 1.4,
                        color: CustomColors.blackColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 259,
                    height: 43,
                    child: TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(72),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(72),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: CustomColors.whiteColor,
                          hintText: "Enter your email here",
                          hintStyle: const TextStyle(
                              color: CustomColors.mediumGreyColor),
                          suffixIcon: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 7.0),
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    backgroundColor: CustomColors.darkColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(43)),
                                    minimumSize: const Size(75, 29)),
                                child: const Text(
                                  "Send",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: CustomColors.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          contentPadding: const EdgeInsets.only(left: 21)),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 578,
              decoration: BoxDecoration(
                color: CustomColors.darkColor,
                border: Border.all(color: CustomColors.darkColor),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Download App",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: CustomColors.whiteColor,
                  ),
                ),
                const SizedBox(
                  height: 34,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 159,
                          child: Image.asset(AppMediaPaths.playStoreQrLogo),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        SizedBox(
                          height: 28,
                          child: Image.asset(AppMediaPaths.googlePlayLogo),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 159,
                          child: Image.asset(AppMediaPaths.appStoreQrLogo),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        SizedBox(
                          height: 28,
                          child: Image.asset(
                            AppMediaPaths.appleLogo,
                            color: CustomColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                const Text(
                  "Invite a Friend",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: CustomColors.whiteColor,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 308,
                      height: 238,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: CustomColors.darkColor.withOpacity(0.4),
                              blurRadius: 12,
                              spreadRadius: 0.1,
                              offset: const Offset(0, 2))
                        ],
                        color: CustomColors.whiteColor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 260,
                          child: Text(
                            "Invite a friend to ORUphones application.\nTap to copy the respective download link to the clipboard",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: CustomColors.blackColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ApplicationStoreButton(
                          appStore: "Google Play",
                          logo: AppMediaPaths.googlePlayLogo,
                          subtitle: "GET IT ON",
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        ApplicationStoreButton(
                          appStore: "App Store",
                          logo: AppMediaPaths.appleLogo,
                          subtitle: "Download on the",
                          isAppStore: true,
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Or share via"),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ShareOnAppButton(
                      platform: SocialPlatform.facebook,
                      appLogo: AppMediaPaths.instagramLogo,
                    ),
                    ShareOnAppButton(
                      platform: SocialPlatform.telegram,
                      appLogo: AppMediaPaths.telegramLogo,
                    ),
                    ShareOnAppButton(
                      platform: SocialPlatform.twitter,
                      appLogo: AppMediaPaths.twitterLogo,
                    ),
                    ShareOnAppButton(
                      platform: SocialPlatform.whatsapp,
                      appLogo: AppMediaPaths.whatsappLogo,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class ShareOnAppButton extends StatelessWidget {
  final SocialPlatform platform;
  final String appLogo;

  const ShareOnAppButton({
    super.key,
    required this.platform,
    required this.appLogo,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        highlightColor: Colors.transparent,
        overlayColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      onPressed: () async {
        await SocialSharingPlus.shareToSocialMedia(
          platform,
          "I'd like to introduce you to Oru Phones, a user-friendly and convenient platform designed for buying and selling refurbished smartphones. With just three simple steps, you can easily sell your phones at competitive prices or purchase high-quality refurbished phones that look and work like new. Experience Oru Phones today by downloading the app\n\niOS: https://apps.apple.com/dk/app/oruphones-sell-used-phones/id1629378420\n\nAndroid: https://play.google.com/store/apps/details?id=com.oruphones.oru",
        );
      },
      icon: SizedBox(
        height: 40,
        child: Image.asset(appLogo),
      ),
    );
  }
}

class ApplicationStoreButton extends StatelessWidget {
  final String appStore;
  final String logo;
  final String subtitle;
  final bool isAppStore;
  const ApplicationStoreButton({
    super.key,
    required this.appStore,
    required this.logo,
    required this.subtitle,
    this.isAppStore = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 166,
      height: 55,
      decoration: BoxDecoration(
        color: const Color(0xff121212),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Row(
        children: [
          SizedBox(
            height: 30,
            child: Image.asset(
              logo,
              color: isAppStore ? CustomColors.whiteColor : null,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: CustomColors.whiteColor,
                ),
              ),
              Text(
                appStore,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: CustomColors.whiteColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class FAQExpansionTile extends StatefulWidget {
  final FaqModel faqData;
  const FAQExpansionTile({
    super.key,
    required this.faqData,
  });

  @override
  State<FAQExpansionTile> createState() => _FAQExpansionTileState();
}

class _FAQExpansionTileState extends State<FAQExpansionTile> {
  ValueNotifier<bool> isExpanded = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 10.0).copyWith(bottom: 10),
      child: ValueListenableBuilder(
        valueListenable: isExpanded,
        builder: (context, expandedValue, child) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: expandedValue
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 8,
                      spreadRadius: 0.5,
                      offset: const Offset(3, 3),
                    )
                  ]
                : [],
          ),
          child: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: ExpansionTile(
              showTrailingIcon: false,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(
                  color: CustomColors.lightGreyColor,
                  width: 2,
                ),
              ),
              backgroundColor: CustomColors.extraLightGreyColor,
              collapsedBackgroundColor: CustomColors.extraLightGreyColor,
              collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(
                  color: CustomColors.lightGreyColor,
                  width: 2,
                ),
              ),
              onExpansionChanged: (hasExpanded) {
                isExpanded.value = hasExpanded;
              },
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 280,
                    child: Text(
                      widget.faqData.question,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  AnimatedRotation(
                    duration: const Duration(milliseconds: 300),
                    turns: expandedValue ? 1 / 8 : 0,
                    curve: Curves.easeIn,
                    child: const Icon(
                      Icons.add,
                      color: CustomColors.blackColor,
                    ),
                  )
                ],
              ),
              children: [
                Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16).copyWith(
                      top: 18,
                      bottom: 14,
                    ),
                    child: Text(
                      widget.faqData.answer,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopBrandsList extends StatefulWidget {
  const TopBrandsList({super.key});

  @override
  State<TopBrandsList> createState() => _TopBrandsListState();
}

class _TopBrandsListState extends State<TopBrandsList> {
  late HomeRepository _homeRepository;

  @override
  void initState() {
    _homeRepository = HomeRepository();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () =>
          GetBrandsViewModel(homeRepository: _homeRepository),
      builder: (context, viewModel, child) {
        if (viewModel.isBusy) {
          return const Center(child: CircularProgressIndicator());
        }

        final brands = viewModel.data as List<BrandModel>;

        return SizedBox(
          height: 64,
          child: ListView.builder(
            itemCount: brands.length + 1,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (index == brands.length) {
                return Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomColors.extraLightGreyColor,
                  ),
                  padding: const EdgeInsets.all(6),
                  child: const Row(
                    children: [
                      Text(
                        "View All",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: CustomColors.blueColor,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 12,
                      ),
                    ],
                  ),
                );
              }

              return Padding(
                padding: const EdgeInsets.only(right: 14.0),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomColors.extraLightGreyColor,
                  ),
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: Image.network(
                      brands[index].imagePath,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class ItemCard extends StatefulWidget {
  final ProductModel productData;
  const ItemCard({
    super.key,
    required this.productData,
  });

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  ValueNotifier<bool> isFavourite = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: CustomColors.lightGreyColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 181,
                  child: Image.network(
                    widget.productData.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                widget.productData.openForNegotiation
                    ? Container(
                        width: double.infinity,
                        height: 21,
                        color: const Color(0xff4C4C4C).withOpacity(0.69),
                        alignment: Alignment.center,
                        child: const Text(
                          "PRICE NEGOTIABLE",
                          style: TextStyle(
                            fontSize: 9.6,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          widget.productData.verified
                              ? Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(AppMediaPaths.bookmarkLogo),
                                    Positioned(
                                      top: 5,
                                      left: 10,
                                      child: Center(
                                        child: RichText(
                                          text: const TextSpan(
                                            text: "ORU",
                                            style: TextStyle(
                                              fontSize: 9.6,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Poppins",
                                            ),
                                            children: [
                                              TextSpan(
                                                text: "Verified",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                          Padding(
                            padding: const EdgeInsets.only(right: 6.0),
                            child: GestureDetector(
                              onTap: () {
                                isFavourite.value = !isFavourite.value;
                              },
                              child: ValueListenableBuilder(
                                valueListenable: isFavourite,
                                builder: (context, isFavouriteValue, child) {
                                  if (isFavouriteValue) {
                                    return const Icon(
                                      CupertinoIcons.heart_fill,
                                      color: Colors.red,
                                    );
                                  } else {
                                    return const Icon(
                                      CupertinoIcons.heart,
                                      color: Colors.white,
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productData.marketingName,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "${widget.productData.deviceRam}/${widget.productData.deviceStorage} GB \u2022 ${widget.productData.deviceCondition}",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: CustomColors.mediumGreyColor,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "₹ ${widget.productData.discountedPrice ?? widget.productData.listingPrice}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: CustomColors.blackColor,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      widget.productData.originalPrice != null
                          ? RichText(
                              text: TextSpan(
                                text: "₹ ${widget.productData.originalPrice} ",
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: CustomColors.mediumGreyColor,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        "(${widget.productData.discountPercentage?.round()}% off)",
                                    style:
                                        TextStyle(color: CustomColors.redColor),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              height: 21,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                color: const Color(0xffDFDFDF).withOpacity(0.77),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      "${widget.productData.listingLocation}, ${widget.productData.listingState}",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: CustomColors.mediumGreyColor,
                      ),
                    ),
                  ),
                  Text(
                    widget.productData.listingDate,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: CustomColors.mediumGreyColor,
                    ),
                  ),
                ],
              ),
            )
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
              autoPlayInterval: const Duration(seconds: 3)),
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
                  height: 6,
                  width: 6,
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
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: CustomColors.lightGreyColor),
          color: Colors.transparent,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
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
