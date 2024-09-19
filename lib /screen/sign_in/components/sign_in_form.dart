import 'package:flutter/material.dart';

import '../../../components/custom_suffix_icon.dart';
import '../../../components/error_form.dart';
import '../../../components/my_default_button.dart';
import '../../../constant.dart';
import '../../../size_config.dart';
import '../../forgot_password/forgot_password_screen.dart';
import '../../login_success/login_success_screen.dart';


class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key
  });

  @override
  State < SignInForm > createState() => _SignInFormState();
}

class _SignInFormState extends State < SignInForm > {
  final _formKey = GlobalKey < FormState > ();
  List < String > errors = [];
  String ? email;
  String ? password;
  bool valueRemember = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          emailFormField(),
          SizedBox(height: getPropotionateScreenHeight(30)),
          passwordFormField(),
          SizedBox(height: getPropotionateScreenHeight(30)),
          rememberAndForgot(),
          SizedBox(
            height: getPropotionateScreenHeight(20),
          ),
          ErrorForm(
            errors: errors,
          ),
          SizedBox(height: getPropotionateScreenHeight(20)),
          MyDefaultButton(
            text: 'Sign In',
            onPressed: () { if(_formKey.currentState!.validate()){
              _formKey.currentState!.save();
            }
            // if(errors.isEmpty){
               Navigator.pushNamed(context, LoginSuccessScreen.routeName);
            // }
           
            },
            
            )
        ],
      ));
  }

  Row rememberAndForgot() {
    return Row(
      children: [
        Checkbox(
          activeColor: kPrimaryColor,
          value: valueRemember,
          onChanged: (value) {
            setState(() {
              valueRemember = value!;
            });
          }),
        Text(
          'Remember me',
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
          },
          child: Text(
            'Forgot Password?',
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }

  TextFormField passwordFormField() {
    return TextFormField(
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        //Do something with the value
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (errors.contains(kPassNullError) &&
          value.length > 8) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
          return "";
        } else if (value.length < 8 && (!errors.contains(kPassNullError) && !errors.contains(kShortPassError))) {
          setState(() {
            errors.add(kShortPassError);
          });
          return "";
        }
        return null;
      },
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Enter Your Password',
        contentPadding: EdgeInsets.symmetric(
          horizontal: 42,
          vertical: 20,
        ),
        suffixIcon: CustomSuffixIcon(
          icon: 'assets/icons/Lock.svg',
          size: 14,
        )),
    );
  }

  TextFormField emailFormField() {
    return TextFormField(
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) && errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value) && !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'Enter Your Email',
        contentPadding: EdgeInsets.symmetric(
          horizontal: 42,
          vertical: 20,
        ),
        suffixIcon: CustomSuffixIcon(
          icon: 'assets/icons/Mail.svg',
          size: 18,
        )),
    );
  }
}