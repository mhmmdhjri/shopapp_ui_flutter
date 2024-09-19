import 'package:flutter/material.dart';

import 'forgot_password_form.dart';


class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 4,
              ),
              Text("forgot password",
              style: TextStyle(
                fontSize:  28,
                fontWeight: FontWeight.bold,
               color: Colors.black
              ),
              ),
              Text("Please", textAlign: TextAlign.center,),
              SizedBox(
                height: 20,
              ),
              ForgotPasswordForm(),
          
            ],
          ),
        ),
      ),
    );
  }
}



