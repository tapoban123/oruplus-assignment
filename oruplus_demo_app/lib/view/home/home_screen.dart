import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oruplus_demo_app/data/app_data.dart';
import 'package:oruplus_demo_app/data_model/brand_model.dart';
import 'package:oruplus_demo_app/data_model/other_models.dart';
import 'package:oruplus_demo_app/model/home/home_repository.dart';
import 'package:oruplus_demo_app/utils/app_media_paths.dart';
import 'package:oruplus_demo_app/utils/custom_colors.dart';
import 'package:oruplus_demo_app/view_model/home/home_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
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
          )
        ]),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      border: Border.all(color: CustomColors.lightGreyColor),
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
              GridView.builder(
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3.2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const ItemCard();
                },
              ),
              FaqsDisplay(),
            ],
          ),
        ),
      ),
    );
  }
}

class FaqsDisplay extends StatelessWidget {
  const FaqsDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Frequently Asked Questions",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        Container(
          child: ExpansionTile(
            title:
                Text("What are the benefits of selling phones on ORUphones?"),
                children: [],
          ),
        )
      ],
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
  const ItemCard({super.key});

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
                    child: Image.asset(
                      AppMediaPaths.iphoneImg,
                      fit: BoxFit.cover,
                    )),
                Container(
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
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
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
                          ),
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
                  const Text(
                    "Apple iPhone 13 Pro",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Text(
                    "12/256 GB \u2022 Like New",
                    style: TextStyle(
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
                      const Text(
                        "₹ 41,500",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: CustomColors.blackColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      RichText(
                        text: const TextSpan(
                          text: "₹ 81,500 ",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: CustomColors.mediumGreyColor,
                          ),
                          children: [
                            TextSpan(
                              text: "(45% off)",
                              style: TextStyle(color: CustomColors.redColor),
                            ),
                          ],
                        ),
                      ),
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      "Nijampur, Lucknow",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: CustomColors.mediumGreyColor,
                      ),
                    ),
                  ),
                  Text(
                    "July 25th",
                    style: TextStyle(
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
      child: Chip(
        color:
            WidgetStatePropertyAll(Theme.of(context).scaffoldBackgroundColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: CustomColors.lightGreyColor),
        ),
        label: Row(
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
