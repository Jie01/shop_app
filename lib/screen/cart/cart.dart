import 'package:flutter/material.dart';
import 'package:shop_app/checkout/checkout.dart';
import 'package:shop_app/components/dbtn_likeBtn.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/size_config.dart';

import 'Component/item_card.dart';

class Carts extends StatefulWidget {
  static String routeName = "/cart";
  @override
  _CartsState createState() => _CartsState();
}

class _CartsState extends State<Carts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: ListView.builder(
          itemCount: demoCarts.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Dismissible(
              onDismissed: (direction) {
                setState(() {
                  demoCarts.removeAt(index);
                });
              },
              direction: DismissDirection.endToStart,
              key: Key(demoCarts[index].product.id.toString()),
              background: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Color(0xffffe6e6),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Spacer(),
                    Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                    )
                  ],
                ),
              ),
              child: ItemCard(
                cart: demoCarts[index],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(
        press: () {
          if (demoCarts.length != 0) {
            Navigator.pushNamed(context, Checkout.routeName);
          }
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${demoCarts.length} items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}

String total() {
  double a = 0;
  for (int i = 0; i <= demoCarts.length - 1; i++) {
    if (demoCarts[i].numItem > 1) {
      for (int x = 0; x < demoCarts[i].numItem; x++) {
        a = a + demoCarts[i].product.price;
      }
    } else {
      a = a + demoCarts[i].product.price;
    }
  }
  return a.toStringAsFixed(2);
}

class BottomBar extends StatelessWidget {
  final Function press;

  const BottomBar({
    Key key,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(30),
          vertical: getProportionateScreenWidth(15)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xffdadada).withOpacity(0.15),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: Color(0xfff5f6f9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.receipt,
                    color: kprimaryc,
                    size: 27,
                  ),
                ),
                Spacer(),
                Text("Add voucher code"),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: ktextc,
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(text: "Total: \n", children: [
                    TextSpan(
                      text: "\$${total()}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: DBtn(
                    text: "Check Out",
                    pressed: press,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
