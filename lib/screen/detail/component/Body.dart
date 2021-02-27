import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/dbtn_likeBtn.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/screen/cart/cart.dart';
import 'package:shop_app/screen/detail/component/product_image.dart';
import 'package:shop_app/size_config.dart';

import 'btn_Dpro_Customapp.dart';
import 'color_dot.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImage(product: product),
          rcontainer(
            color: Colors.white,
            child: Column(
              children: [
                proDescrip(
                  product: product,
                  press: () {},
                ),
                rcontainer(
                  color: Color(0xfff5f6f9),
                  child: Column(
                    children: [
                      Chosecol(product: product),
                      rcontainer(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.1,
                            right: SizeConfig.screenWidth * 0.1,
                            top: getProportionateScreenWidth(5),
                            bottom: getProportionateScreenWidth(30),
                          ),
                          child: DBtn(
                            text: "Add to Cart",
                            pressed: () {
                              if (ChosecolState.added != 0) {
                                demoCarts.add(Cart(
                                    product: product,
                                    numItem: ChosecolState.added));
                                Navigator.pushNamed(context, Carts.routeName);
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class proDescrip extends StatelessWidget {
  const proDescrip({
    Key key,
    @required this.product,
    this.press,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              width: getProportionateScreenWidth(64),
              decoration: BoxDecoration(
                color: product.isFavourite
                    ? kprimaryc.withOpacity(0.15)
                    : kSecondc.withOpacity(0.1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              child: Icon(
                Icons.favorite,
                color:
                    product.isFavourite ? kprimaryc : kSecondc.withOpacity(0.9),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: getProportionateScreenWidth(64),
            ),
            child: Text(
              product.description,
              maxLines: 3,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: GestureDetector(
              onTap: press,
              child: Row(
                children: [
                  Text(
                    "See More Detail",
                    style: TextStyle(
                        color: kprimaryc, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: kprimaryc,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class rcontainer extends StatelessWidget {
  const rcontainer({
    Key key,
    this.color,
    this.child,
  }) : super(key: key);

  final Color color;
  final child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: getProportionateScreenWidth(20)),
      padding: EdgeInsets.only(top: getProportionateScreenWidth(20)),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
      ),
      child: child,
    );
  }
}
