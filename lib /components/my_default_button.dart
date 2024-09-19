import 'package:flutter/material.dart';

import '../constant.dart';
import '../size_config.dart';


class MyDefaultButton extends StatelessWidget {
  const MyDefaultButton({
    super.key, 
    required this.text, 
    required this.onPressed,
  });

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        focusNode: FocusNode(
          skipTraversal: false,
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
            minimumSize: Size(
              double.infinity, 
              getPropotionateScreenHeight(56)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
                )),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: getPropotionateScreenWidth(18),
          ),
        ));
  }
}
