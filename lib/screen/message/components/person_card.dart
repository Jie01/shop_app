import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonCard extends StatelessWidget {
  final String name, youemail;
  final GestureTapCallback press;

  const PersonCard({Key key, this.name, this.youemail, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        leading: Container(
            padding: EdgeInsets.all(7),
            decoration:
                BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
            child: Icon(
              Icons.person_outline,
              size: 35,
            )),
        title: Text(name),
        subtitle: Text(youemail),
        onTap: press,
      ),
      SizedBox(
        height: 5,
      )
    ]);
  }
}
