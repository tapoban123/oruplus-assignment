import 'package:oruplus_demo_app/model/other_models.dart';
import 'package:oruplus_demo_app/utils/app_media_paths.dart';

final List<FeatureModel> featuresList = [
  const FeatureModel(
    feature: "Sell Used Phones",
    isNew: false,
  ),
  const FeatureModel(
    feature: "Buy Used Phones",
    isNew: false,
  ),
  const FeatureModel(
    feature: "Compare Prices",
    isNew: false,
  ),
  const FeatureModel(
    feature: "My Profile",
    isNew: false,
  ),
  const FeatureModel(
    feature: "My Listings",
    isNew: false,
  ),
  const FeatureModel(
    feature: "Services",
    isNew: false,
  ),
  const FeatureModel(
    feature: "Register your Store",
    isNew: true,
  ),
  const FeatureModel(
    feature: "Get the App",
    isNew: false,
  ),
];

List<OnYourMindContentModel> onYourMindContentData = [
  const OnYourMindContentModel(
    imgPath: AppMediaPaths.buyLogo,
    title: "Buy Used Phones",
  ),
  const OnYourMindContentModel(
    imgPath: AppMediaPaths.sellLogo,
    title: "Sell Used Phones",
  ),
  const OnYourMindContentModel(
    imgPath: AppMediaPaths.compareLogo,
    title: "Compare Prices",
  ),
  const OnYourMindContentModel(
    imgPath: AppMediaPaths.profileLogo,
    title: "My Profile",
  ),
  const OnYourMindContentModel(
    imgPath: AppMediaPaths.listingsLogo,
    title: "My Listings",
  ),
  const OnYourMindContentModel(
    imgPath: AppMediaPaths.openStoresLogo,
    title: "Open Store",
  ),
  const OnYourMindContentModel(
    imgPath: AppMediaPaths.servicesLogo,
    title: "Services",
  ),
  const OnYourMindContentModel(
    imgPath: AppMediaPaths.deviceHealthLogo,
    title: "Device Health Check",
  ),
  const OnYourMindContentModel(
    imgPath: AppMediaPaths.batteryHealthLogo,
    title: "Battery Health Check",
  ),
  const OnYourMindContentModel(
    imgPath: AppMediaPaths.imeiLogo,
    title: "IMEI Verification",
  ),
  const OnYourMindContentModel(
    imgPath: AppMediaPaths.deviceDetailsLogo,
    title: "Device Details",
  ),
  const OnYourMindContentModel(
    imgPath: AppMediaPaths.dataWipeLogo,
    title: "Data Wipe",
  ),
  const OnYourMindContentModel(
    imgPath: AppMediaPaths.underWarrantyLogo,
    title: "Under Warranty Phones",
  ),
  const OnYourMindContentModel(
    imgPath: AppMediaPaths.premiumPhoneLogo,
    title: "Premium Phones",
  ),
  const OnYourMindContentModel(
    imgPath: AppMediaPaths.newPhoneLogo,
    title: "Like New Phones",
  ),
  const OnYourMindContentModel(
    imgPath: AppMediaPaths.refurbishedLogo,
    title: "Refurbished Phones",
  ),
  const OnYourMindContentModel(
    imgPath: AppMediaPaths.verifiedLogo,
    title: "Verified Phones",
  ),
  const OnYourMindContentModel(
    imgPath: AppMediaPaths.negotiationsLogo,
    title: "My Negotiations",
  ),
  const OnYourMindContentModel(
    imgPath: AppMediaPaths.favoritesLogo,
    title: "My Favourites",
  ),
];

List<String> brandLogos = [
  AppMediaPaths.appleLogo,
  AppMediaPaths.miLogo,
  AppMediaPaths.samsungLogo,
  AppMediaPaths.vivologo,
  AppMediaPaths.realmeLogo,
  AppMediaPaths.motorolaLogo,
  AppMediaPaths.oppoLogo,
];
