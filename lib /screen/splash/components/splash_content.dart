import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../size_config.dart';
 

class SplashContent extends StatelessWidget {
  const SplashContent({
    super.key,
    required this.text,
    required this.image,
  });

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          'SnapBuy',
          style: TextStyle(
            fontSize: getPropotionateScreenWidth(36),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getPropotionateScreenWidth(14), color: kTeksColor),
        ),
        const Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
          height: getPropotionateScreenHeight(265),
          width: getPropotionateScreenWidth(235),
        )
      ],
    );
  }
}