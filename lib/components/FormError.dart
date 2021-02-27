import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key key,
    @required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(errors.length, (index) => Etext(errors[index])),
    );
  }

  Row Etext(String t) {
    return Row(
      children: [
        Icon(
          Icons.error_outline,
          color: Colors.red,
        ),
        SizedBox(
          width: getProportionateScreenWidth(5),
        ),
        Text(t),
      ],
    );
  }
}

class sicon extends StatelessWidget {
  const sicon({
    Key key,
    this.Icons,
  }) : super(key: key);

  final Icons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
      child: Icon(
        Icons,
        color: ktextc,
      ),
    );
  }
}
