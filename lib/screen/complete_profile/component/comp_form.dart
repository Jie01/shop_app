import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/FormError.dart';
import 'package:shop_app/components/dbtn_likeBtn.dart';
import 'package:shop_app/screen/otp/otp.dart';
import 'package:shop_app/services/database.dart';
import 'package:shop_app/services/helper.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ComplForm extends StatefulWidget {
  @override
  _ComplFormState createState() => _ComplFormState();
}

class _ComplFormState extends State<ComplForm> {
  final _formkey = GlobalKey<FormState>();

  Database database = Database();

  TextEditingController namecontrol = TextEditingController();
  TextEditingController phonecontrol = TextEditingController();
  TextEditingController addrcontrol = TextEditingController();

  String name;
  String address;

  final List<String> errors = [];

  completed() {
    if (_formkey.currentState.validate()) {
      Map<String, String> userInfoMap = {
        "name": namecontrol.text,
        "email": gmail,
        "phone": phonecontrol.text,
        "address": addrcontrol.text,
      };

      database.uploadUserInfo(userInfoMap);

      HelperFunc.saveusername(namecontrol.text);

      Navigator.pushNamed(context, Otp.routeName);
      Otp.phoneN = phonecontrol.text;
      name = namecontrol.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          FnbuildForm(),
          SizedBox(
            height: getProportionateScreenHeight(25),
          ),
          pnbuildForm(),
          SizedBox(
            height: getProportionateScreenHeight(25),
          ),
          adbuildForm(),
          SizedBox(
            height: getProportionateScreenHeight(25),
          ),
          FormError(errors: errors),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          DBtn(
            text: "Continue",
            pressed: () {
              completed();
            },
          ),
          SizedBox(
            height: getProportionateScreenHeight(40),
          ),
          Text(
            "By continuing your confirm that you agree \nwith our Term and Condition",
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  TextFormField FnbuildForm() {
    return TextFormField(
      controller: namecontrol,
      onSaved: (v) => name = v,
      onChanged: (v) {
        if (v.isNotEmpty && errors.contains(cNamelNullError)) {
          setState(() {
            errors.remove(cNamelNullError);
          });
        }
      },
      validator: (v) {
        if (v.isEmpty && !errors.contains(cNamelNullError)) {
          setState(() {
            errors.add(cNamelNullError);
          });
          return "";
        } else if (v.isEmpty) {
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Name",
        hintText: "Enter your name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: sicon(
          Icons: Icons.person,
        ),
      ),
    );
  }

  TextFormField pnbuildForm() {
    return TextFormField(
      controller: phonecontrol,
      keyboardType: TextInputType.number,
      onChanged: (v) {
        if (v.isNotEmpty && errors.contains(cPhoneNumberNullError)) {
          setState(() {
            errors.remove(cPhoneNumberNullError);
          });
        }
      },
      validator: (v) {
        if (v.isEmpty && !errors.contains(cPhoneNumberNullError)) {
          setState(() {
            errors.add(cPhoneNumberNullError);
          });
          return "";
        } else if (v.isEmpty) {
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: sicon(
          Icons: Icons.phone_android,
        ),
      ),
    );
  }

  TextFormField adbuildForm() {
    return TextFormField(
      controller: addrcontrol,
      onSaved: (v) => address = v,
      onChanged: (v) {
        if (v.isNotEmpty && errors.contains(cAddressNullError)) {
          setState(() {
            errors.remove(cAddressNullError);
          });
        }
      },
      validator: (v) {
        if (v.isEmpty && !errors.contains(cAddressNullError)) {
          setState(() {
            errors.add(cAddressNullError);
          });
          return "";
        } else if (v.isEmpty) {
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: sicon(
          Icons: Icons.location_on,
        ),
      ),
    );
  }
}
