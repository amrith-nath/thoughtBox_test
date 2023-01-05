import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thoughtbox_test/core/color/colors.dart';
import 'package:thoughtbox_test/core/keys/keys.dart';
import 'package:thoughtbox_test/core/size/size.dart';
import 'package:thoughtbox_test/views/home/screen_home.dart';

import '../../core/font/fonts.dart';

class ScreenOTP extends StatelessWidget {
  const ScreenOTP({super.key, required this.number});
  final String number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: otpFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'OTP',
                  style: GoogleFont.headTextStyle,
                ),
                Text(
                  'Enter OTP sent to your mobile\nNumber +91$number',
                  textAlign: TextAlign.center,
                  style: GoogleFont.subTextSmallStyle,
                ),
                kHeight,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    otpTextField(context),
                    otpTextField(context),
                    otpTextField(context),
                    otpTextField(context),
                  ],
                ),
                kHeight,
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        validateOtp();
                      },
                      child: Text(
                        'Submit',
                        style: GoogleFont.buttonTextStyle,
                      )),
                ),
                Row(
                  children: [
                    const Spacer(),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Resend OTP',
                          style: GoogleFont.textButtonTextStyle,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  validateOtp() {
    if (otpFormKey.currentState!.validate()) {
      Get.offAll(() => ScreenHome());
    }
  }

  Container otpTextField(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          fillColor: Colors.green.shade100,
          filled: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
        ),
        validator: (value) {
          if (value == null || value.length != 1) {
            return '';
          } else {
            return null;
          }
        },
      ),
    );
  }
}
