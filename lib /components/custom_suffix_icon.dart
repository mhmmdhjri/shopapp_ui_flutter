import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../size_config.dart';


class CustomSuffixIcon extends StatelessWidget {
  const CustomSuffixIcon({
    super.key,
    required this.icon, 
    required this.size,
  });

  final String icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, getPropotionateScreenWidth(20),
          getPropotionateScreenWidth(20), getPropotionateScreenWidth(20)),
      child: SvgPicture.asset(
        icon,
        width: getPropotionateScreenWidth(size),
      ),
    );
  }
}
