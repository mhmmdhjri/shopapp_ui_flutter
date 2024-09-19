import 'package:flutter/material.dart';

import '../../../components/custom_suffix_icon.dart';
import '../../../constant.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenheight * 0.03,
              ),
              Text("Complete your Profile",
              style: headingStyle,),
              Text("Complete your data by filling \n this form", textAlign: TextAlign.center,),
              SizedBox(
                height: SizeConfig.screenheight * 0.06,
              ),
              CompleteProfielForm(),

            ],
          ),
        ),
      ),
    );
  }
}

class CompleteProfielForm extends StatefulWidget {
  const CompleteProfielForm({super.key});

  @override
  State<CompleteProfielForm> createState() => _CompleteProfielFormState();
}

class _CompleteProfielFormState extends State<CompleteProfielForm> {
  String? firstname;
  String? lastname;
  String? phonenumber;
  String? address;

  final _formkey = GlobalKey<FormState>();
  List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
      onSaved: (newValue) => firstname = newValue,
      onChanged: (value) {
        setState(() {
          firstname = value;
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
     
      decoration: const InputDecoration(
        labelText: 'First Name',
        hintText: 'Enter Your First Name',
        contentPadding: EdgeInsets.symmetric(
          horizontal: 42,
          vertical: 20,
        ),
        suffixIcon: CustomSuffixIcon(
          icon: 'assets/icons/User.svg',
          size: 14,
        ),
      ),
    )
      ],
    );
  }
}