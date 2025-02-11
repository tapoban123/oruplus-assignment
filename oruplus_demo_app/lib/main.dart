import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oruplus_demo_app/utils/custom_colors.dart';
import 'package:oruplus_demo_app/view/home/home_screen.dart';
import 'package:oruplus_demo_app/view/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: CustomColors.whiteColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: "OruPhones",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: CustomColors.whiteColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: CustomColors.whiteColor,
          shadowColor: Colors.transparent,
          surfaceTintColor: CustomColors.whiteColor,
          elevation: 0,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: CustomColors.mediumGreyColor)
        ),
        textTheme: Theme.of(context).textTheme.apply(fontFamily: "Poppins"),
      ),
      home: const HomeScreen(),
    );
  }
}
