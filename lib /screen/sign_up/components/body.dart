import 'package:flutter/material.dart';

import '../../../components/custom_suffix_icon.dart';
import '../../../components/error_form.dart';
import '../../../components/my_default_button.dart';
import '../../../constant.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Register account",
            style: headingStyle,
          ),
          const Text(
            "Complete your detail or continue \n with social media",
            textAlign: TextAlign.center,
          ),
          const SignUpForm(),
        ],
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String? email;
  String? password;
  String? confirmpassword;

  final _formkey = GlobalKey<FormState>();
  List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: getPropotionateScreenHeight(26),
              ),
              emailFormField(),
              SizedBox(
                height: getPropotionateScreenHeight(26),
              ),
              passwordFormField(),
              SizedBox(
                height: getPropotionateScreenHeight(26),
              ),
              passwordConfirmationFormField(),
              SizedBox(
                height: getPropotionateScreenHeight(26),
              ),
              ErrorForm(errors: errors),
              MyDefaultButton(text: 'Sign up', onPressed: () {

              }),
              SizedBox(
                height: SizeConfig.screenheight * 0.06,
              ),
              SizedBox(
                height: SizeConfig.screenheight * 0.03,
              ),
              const Text(
                "By continuing your confirm that you agree \n with our terms and conditions",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenheight * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField passwordFormField() {
    return TextFormField(
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        setState(() {
          password = value;
        });
        //Do something with the value
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length > 8 && errors.contains(kShortPassError)) {
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
        ),
      ),
    );
  }

  TextFormField passwordConfirmationFormField() {
    return TextFormField(
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        //Do something with the value
        if (password == value) {
          setState(() {
            errors.remove(kMatchPassError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty || errors.contains(kMatchPassError)) {
          return "Please confirm your password";
        } else if (value != password) {
          setState(() {
            errors.add(kMatchPassError);
          });
          return "Passwords do not match";
        }
        return null;
      },
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'RE-Enter Your Password',
        contentPadding: EdgeInsets.symmetric(
          horizontal: 42,
          vertical: 20,
        ),
        suffixIcon: CustomSuffixIcon(
          icon: 'assets/icons/Lock.svg',
          size: 14,
        ),
      ),
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
        ),
      ),
    );
  }
}
