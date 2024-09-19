import 'package:flutter/material.dart';

import 'constant.dart';
import 'size_config.dart';

  ThemeData themeData() {
    return ThemeData(
      fontFamily: 'Muli',
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: textTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      inputDecorationTheme: inputDecorationTheme()
    );
  }
  TextTheme textTheme() {
    return const TextTheme(
      titleMedium: TextStyle(color: kTeksColor),
      bodyMedium: TextStyle(color: kTeksColor)
    );
  }
  InputDecorationTheme inputDecorationTheme() {
    const outlineInputBorder = OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: kPrimaryColor)
                    );
    var textStyle = TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getPropotionateScreenWidth(16),
                      color: kPrimaryColor
                    );
    return InputDecorationTheme(
        labelStyle: textStyle,
                    enabledBorder: outlineInputBorder,
                    focusedBorder: outlineInputBorder,
                    border: outlineInputBorder,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
      );
  }

