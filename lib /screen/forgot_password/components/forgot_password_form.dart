import 'package:flutter/material.dart';
import '../../../components/custom_suffix_icon.dart';
import '../../../components/error_form.dart';
import '../../../components/my_default_button.dart';
import '../../../constant.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>(); // Declare the form key
  List<String> errors = [];
  String? email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          emailFormField(),
          const SizedBox(
            height: 10,
          ),
          ErrorForm(errors: errors,),
          const SizedBox(
            height: 10,
          ),
          MyDefaultButton(text: "Reset Password", onPressed: (){
            if(_formKey.currentState!.validate()){
              _formKey.currentState!.save();
            }
          }),
          SizedBox(
            height: 13,
          ),
           dontHaveAccount()

          // Add other form fields and widgets here
        ],
      ),
    );
  }

  Row dontHaveAccount() {
    return const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'don\'t have any Account?'
                  ),
                Text(
                  ' Sign Up',
                  style: TextStyle(
                    color: kPrimaryColor,
                  ),
                )
              ],
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
        ),
      ),
    );
  }
}
