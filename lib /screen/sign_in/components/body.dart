import 'package:flutter/material.dart';

import '../../../components/social_media_icon.dart';
import '../../../constant.dart';
import '../../../size_config.dart';
import '../../sign_up/sign_up_screen.dart';

import 'sign_in_form.dart';


class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(getPropotionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Welcome',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getPropotionateScreenWidth(28),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: SizeConfig.screenheight * 0.06,
              ),
              const Text(
                'Sign in with your email  & password \nor continue with Social Media',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getPropotionateScreenHeight(20),
              ),
              SignInForm(),
              SizedBox(
                height: getPropotionateScreenHeight(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialMediaIcon(
                    press: () {},
                    icon: 'assets/icons/google-icon.svg',
                  ),
                  SocialMediaIcon(
                    press: (){}, 
                    icon: 'assets/icons/facebook-2.svg'),
                  SocialMediaIcon(
                    press: (){}, 
                    icon: 'assets/icons/twitter.svg'),
                  
                ],
              ),
              SizedBox(
                    width: getPropotionateScreenHeight(20),
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'don\'t have any Account?'
                    ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignUpScreen.routeName);
                    },
                    child: const Text(
                        ' Sign Up',
                        style: TextStyle(
                          color: kPrimaryColor,
                        ),
                        
                      ),
                  ),
                  
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
