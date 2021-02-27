import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/enum.dart';
import 'package:shop_app/models/Cutom_appbar.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/screen/detail/component/btn_Dpro_Customapp.dart';
import 'package:shop_app/screen/detail/detail.dart';
import 'package:shop_app/size_config.dart';

class Like extends StatelessWidget {
  static String routeName = "/like";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text("Favourite Product"),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: likeProduct.length != 0
            ? GridView.builder(
                itemCount: likeProduct.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: likeProduct[index],
                    press: () {
                      Navigator.pushNamed(
                        context,
                        Detail.routeName,
                        arguments: Dproduct(product: demoProducts[index]),
                      );
                    },
                  );
                })
            : Center(
                child: Text(
                "you haven't like any product \n go to like now!",
                textAlign: TextAlign.center,
              )),
      ),
      bottomNavigationBar: CustomBottombar(selected: MenuState.favourite),
    );
  }
}
