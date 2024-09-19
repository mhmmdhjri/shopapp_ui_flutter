import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../size_config.dart';


class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon({
    super.key,
    required this.press, 
    required this.icon,
  });

  final VoidCallback press;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(getPropotionateScreenWidth(12)),
        height: getPropotionateScreenWidth(40),
        width: getPropotionateScreenWidth(40),
        margin: EdgeInsets.all(getPropotionateScreenWidth(12)),
        decoration:
            const BoxDecoration(color: Color(0xfff5f6f9), shape: BoxShape.circle),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
