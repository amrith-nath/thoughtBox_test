import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thoughtbox_test/core/color/colors.dart';
import 'package:thoughtbox_test/core/font/fonts.dart';
import 'package:thoughtbox_test/views/login/screen_login.dart';
import 'package:thoughtbox_test/views/splash/screen_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Thought Box',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: secondaryColor,
            elevation: 0,
            centerTitle: true,
            titleTextStyle: GoogleFont.appbarTextStyle,
          ),
          primaryColor: primaryColor,
          scaffoldBackgroundColor: secondaryColor,
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: primaryColor,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(backgroundColor: primaryColor))),
      home: ScreenSplash(),
    );
  }
}
