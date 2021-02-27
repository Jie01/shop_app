import 'package:flutter/material.dart';
import 'package:shop_app/screen/detail/component/Body.dart';

import 'component/btn_Dpro_Customapp.dart';

class Detail extends StatelessWidget {
  static String routeName = "/detail";

  @override
  Widget build(BuildContext context) {
    final Dproduct arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xfff5f6f9),
      appBar: CustomAppBar(
        rating: arguments.product.rating,
      ),
      body: Body(
        product: arguments.product,
      ),
    );
  }
}
