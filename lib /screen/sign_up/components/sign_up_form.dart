import 'package:flutter/material.dart';

import '../../../components/social_media_icon.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
              );
        
}
}