import 'dart:io';
import 'package:shop_app/checkout/paypal.dart';
import 'package:shop_app/checkout/server_stub.dart';
import 'package:flutter/material.dart';

import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/screen/cart/cart.dart';
import 'package:shop_app/screen/home/home.dart';

class Checkout extends StatefulWidget {
  static String routeName = "/checkout";

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check Out"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(demoCarts.length, (index) {
                    return ListItem(
                      index: index,
                    );
                  })
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Total",
              style: TextStyle(fontSize: 25),
            ),
            Text(
              total(),
              style: TextStyle(fontSize: 40, color: Colors.black),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Pay Methods",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  PayTile(
                    text: "Credit Card",
                    image: "assets/images/credit card.png",
                    press: () async {
                      final sessonId = await Server().createCheckout();
                      print("sessions id: $sessonId");

                      final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Stripe(
                                    sessionId: sessonId,
                                  )));
                      print("result: $result");
                      if (result == null) {
                        Navigator.pushReplacementNamed(context, Home.routeName);
                        setState(() {
                          demoCarts.clear();
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final int index;

  const ListItem({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          demoCarts[index].product.title,
          style: TextStyle(fontSize: 18),
        ),
        Row(
          children: [
            Text(demoCarts[index].product.price.toString()),
            SizedBox(
              width: 10,
            ),
            Text("×${demoCarts[index].numItem.toString()}"),
          ],
        ),
      ],
    );
  }
}

class PayTile extends StatelessWidget {
  final String image, text;
  final Function press;

  const PayTile({Key key, this.image, this.text, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: 320,
                  color: Colors.black26,
                  colorBlendMode: BlendMode.darken,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text.rich(TextSpan(
                    children: [
                      TextSpan(
                        text: "$text\n",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
