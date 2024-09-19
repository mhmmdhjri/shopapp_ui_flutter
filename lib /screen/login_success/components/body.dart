import 'package:flutter/material.dart';

import '../../../components/my_default_button.dart';
import '../../sign_in/sign_in_screen.dart';

class Body extends StatelessWidget {

  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Image.asset('assets/images/success.png'),
          SizedBox(height: 20,),
          const Text("login success", style: 
          TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),),
          const Spacer(flex: 1,),
          SizedBox(
            width: 300,
            child: MyDefaultButton(text: "Back To Home", onPressed: (){
               Navigator.pushNamed(context, SignInScreen.routeName);
            }),
          ),
          Spacer(),
        ],
      ),
    );
  }
}