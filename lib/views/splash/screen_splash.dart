import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thoughtbox_test/core/font/fonts.dart';
import 'package:thoughtbox_test/views/home/screen_home.dart';
import 'package:thoughtbox_test/views/login/screen_login.dart';

import '../../core/size/size.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startNavigate();
    });

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'ThoughtBox',
            style: GoogleFont.splashTestStyle,
          ),
          kHeight,
          const CircularProgressIndicator()
        ],
      )),
    );
  }

  Future<void> startNavigate() async {
    await Future.delayed(const Duration(seconds: 3));

    Get.off(() => ScreenLogin());
  }
}
