import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thoughtbox_test/core/font/fonts.dart';
import 'package:thoughtbox_test/core/keys/keys.dart';
import 'package:thoughtbox_test/core/size/size.dart';
import 'package:thoughtbox_test/views/otp/screen_otp.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});

  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              kHeight,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Welcome,',
                    style: GoogleFont.headTextStyle,
                  ),
                  Text(
                    'Login TO Continue',
                    style: GoogleFont.subTextStyle,
                  ),
                  kHeight,
                  inputWidget(
                      controller: _numberController,
                      hintText: 'Mobile Number',
                      isPassword: false,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Phone number is required ';
                        } else if (text.length != 10) {
                          return 'Invalid Number';
                        } else {
                          return null;
                        }
                      }),
                  kHeight,
                  inputWidget(
                      controller: _passwordController,
                      hintText: 'Password',
                      isPassword: true,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Password is required ';
                        } else {
                          return null;
                        }
                      }),
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password',
                            style: GoogleFont.textButtonTextStyle,
                          ))
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          validateForm();
                        },
                        child: Text(
                          'Login',
                          style: GoogleFont.buttonTextStyle,
                        )),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Do Not Have An Account',
                        style: GoogleFont.subTextSmallStyle,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Register',
                            style: GoogleFont.textButtonTextStyle,
                          ))
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }

  validateForm() {
    if (loginFormKey.currentState!.validate()) {
      Get.to(() => ScreenOTP(
            number: _numberController.text,
          ));
    }
  }

  TextFormField inputWidget(
      {required TextEditingController controller,
      required String hintText,
      required bool isPassword,
      required String? Function(String?) validator}) {
    return TextFormField(
      keyboardType: !isPassword ? TextInputType.phone : TextInputType.text,
      obscureText: isPassword,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFont.inputTextStyle,
          fillColor: Colors.green.shade100,
          filled: true,
          suffixIcon: isPassword
              ? const Icon(
                  Icons.visibility_off,
                  color: Colors.black,
                )
              : const SizedBox(),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5),
          )),
    );
  }
}
