import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shop_app/models/Cart.dart';

import '../constants.dart';

int _total() {
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
  a = a * 100;
  return a.round();
}

class Server {
  Future<String> createCheckout() async {
    final auth = 'Basic ' + base64Encode(utf8.encode('$secretKey2:'));
    final body = {
      'payment_method_types': ['card'],
      'line_items': [
        {
          'price_data': {
            'currency': 'hkd',
            'product_data': {
              'name': 'Total',
            },
            'unit_amount': _total(),
          },
          'quantity': 1,
        },
      ],
      'mode': 'payment',
      'success_url': 'https://success.com/{CHECKOUT_SESSION_ID}',
      'cancel_url': 'https://cancel.com/',
    };

    try {
      final result = await Dio().post(
        "https://api.stripe.com/v1/checkout/sessions",
        data: body,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: auth},
          contentType: "application/x-www-form-urlencoded",
        ),
      );
      return result.data['id'];
    } on DioError catch (e, s) {
      print(e.response);
      throw e;
    }
  }
}
