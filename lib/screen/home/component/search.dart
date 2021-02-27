import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/components/searchCard.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/screen/detail/component/btn_Dpro_Customapp.dart';
import 'package:shop_app/screen/detail/detail.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SearchScreen extends StatefulWidget {
  final String scearchproduct;

  const SearchScreen({Key key, this.scearchproduct = ""}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product> searchproList = [];
  String sproduct = "";

  a() {
    if (widget.scearchproduct != "null" ||
        widget.scearchproduct != ' ' ||
        widget.scearchproduct != null) {
      print(widget.scearchproduct);
      demoProducts.forEach((e) {
        if (!searchproList.contains(e)) {
          if (e.title.contains(widget.scearchproduct)) {
            setState(() {
              searchproList.add(e);
            });
          }
          if (!e.title.contains(widget.scearchproduct)) {
            setState(() {
              searchproList.removeWhere((element) => e == element);
            });
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    a();
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          borderRadius: BorderRadius.circular(50),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey[600],
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          height: 50,
          decoration: BoxDecoration(
            color: kSecondc.withOpacity(0.15),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: "Search Product",
              prefixIcon: Icon(Icons.search),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenWidth(9)),
            ),
            onChanged: (v) {
              setState(() {
                sproduct = v;
              });
            },
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                ...List.generate(
                    searchproList.length,
                    (index) => InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Detail.routeName,
                            arguments: Dproduct(product: searchproList[index]),
                          );
                        },
                        child: searchCard(
                          product: searchproList[index],
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
