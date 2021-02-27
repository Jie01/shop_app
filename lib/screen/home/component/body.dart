import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/screen/cart/cart.dart';
import 'package:shop_app/screen/detail/component/btn_Dpro_Customapp.dart';
import 'package:shop_app/screen/detail/detail.dart';
import 'package:shop_app/screen/home/component/search.dart';
import 'package:shop_app/screen/home/component/special_card.dart';
import 'package:shop_app/size_config.dart';

import 'cartego.dart';
import '../../../components/iconbtn.dart';

class Body extends StatelessWidget {
  List<Map<String, dynamic>> sc = [
    {
      "image": "assets/images/Image Banner 2.png",
      "text": "Smartphone",
      "num": 18,
    },
    {
      "image": "assets/images/Image Banner 3.png",
      "text": "Fashion",
      "num": 24,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: getProportionateScreenWidth(16),
              ),
              header(),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              DiscountBar(
                text1: "A New Year Surprise",
                text2: "Cashback 20%",
                press: () {},
              ),
              SizedBox(
                height: getProportionateScreenWidth(26),
              ),
              Cartego(),
              SizedBox(
                height: getProportionateScreenWidth(26),
              ),
              SectionTitle(
                text: "Special for you",
                press: () {},
              ),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      sc.length,
                      (index) => SpecialCard(
                        image: sc[index]["image"],
                        categ: sc[index]["text"],
                        brnum: sc[index]["num"],
                        press: () {},
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(26),
              ),
              SectionTitle(
                text: "Popular Product",
                press: () {},
              ),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      demoProducts.length,
                      (index) => ProductCard(
                        product: demoProducts[index],
                        press: () {
                          Navigator.pushNamed(
                            context,
                            Detail.routeName,
                            arguments: Dproduct(product: demoProducts[index]),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class header extends StatelessWidget {
  const header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Text(
          "SSDC Store",
          style: TextStyle(
              fontFamily: "roboto",
              color: Colors.grey[700],
              fontSize: 30,
              fontWeight: FontWeight.w900),
        )),
        IconBtn(
          icon: Icons.search,
          press: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SearchScreen()));
          },
          num: 0,
        ),
        SizedBox(
          width: 10,
        ),
        IconBtn(
          icon: Icons.shopping_cart,
          press: () {
            Navigator.pushNamed(context, Carts.routeName);
          },
          num: 0,
        ),
      ],
    );
  }
}

class DiscountBar extends StatelessWidget {
  const DiscountBar({
    Key key,
    this.text1,
    this.text2,
    this.press,
  }) : super(key: key);

  final String text1;
  final String text2;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenWidth(15)),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xff4a3298), borderRadius: BorderRadius.circular(20)),
        child: Text.rich(
          TextSpan(
            text: "$text1\n",
            style: TextStyle(color: Colors.white),
            children: [
              TextSpan(
                  text: "$text2",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.black,
          ),
        ),
        GestureDetector(onTap: press, child: Text("See More")),
      ],
    );
  }
}
