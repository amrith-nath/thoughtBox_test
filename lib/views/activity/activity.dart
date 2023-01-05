import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:thoughtbox_test/core/color/colors.dart';

class ActivityScreen extends StatelessWidget {
  ActivityScreen({super.key});

  final Set<String> json = {
    "000111000100110000110101001100010011100011010110110001101010110001001010001010011",
  };

  @override
  Widget build(BuildContext context) {
    List<int> binaryList =
        json.first.split('').map((e) => int.parse(e)).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity'),
      ),
      body: GridView.builder(
          itemCount: binaryList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 9),
          itemBuilder: (context, index) {
            bool isZero = binaryList[index] == 0;
            return Container(
              margin: const EdgeInsets.all(5),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: isZero ? aRed : aGreen,
                shape: isZero ? BoxShape.circle : BoxShape.rectangle,
              ),
            );
          }),
    );
  }
}
