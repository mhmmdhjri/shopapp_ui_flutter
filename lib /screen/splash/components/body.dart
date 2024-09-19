import 'package:flutter/material.dart';

import '../../../components/my_default_button.dart';
import '../../../constant.dart';
import '../../../model/splash_data.dart';
import '../../../size_config.dart';
import '../../sign_in/sign_in_screen.dart';
import 'splash_content.dart';


class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                      text: splashData[index]["text"]!,
                      image: splashData[index]["image"]!),
                )),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getPropotionateScreenWidth(20)),
                child: Column(
                  children: [
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(splashData.length,
                          (index) => dotBuilder(index: index)),
                    ),
                    const Spacer(
                      flex: 3,
                    ),
                    MyDefaultButton(
                        text: "Continue",
                        onPressed: currentPage == 2
                            ? () {
                                Navigator.pushNamed(
                                    context, SignInScreen.routeName);
                              }
                            : null),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer dotBuilder({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      height: 6,
      width: currentPage == index ? 20 : 6,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : const Color(0xffd8d8d8),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}
