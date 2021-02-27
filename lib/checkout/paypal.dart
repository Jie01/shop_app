import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../constants.dart';

class Stripe extends StatefulWidget {
  final String sessionId;

  const Stripe({Key key, this.sessionId}) : super(key: key);
  @override
  _StripeState createState() => _StripeState();
}

class _StripeState extends State<Stripe> {
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: WebView(
        initialUrl: initialUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) => _controller = controller,
        onPageFinished: (String url) {
          if (url == initialUrl) {
            print("${initialUrl} is url");
            _redirectToStripe();
          }
        },
        navigationDelegate: (NavigationRequest request) {
          if (request.url.startsWith("https://success.com")) {
            demoCarts.clear();
            Navigator.pop(context);
          } else if (request.url.startsWith("https://cancel.com")) {
            Navigator.of(context).pop("cancel");
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }

  String get initialUrl =>
      'data:text/html;base64,${base64Encode(Utf8Encoder().convert(kStripeHtmlPage))}';

  void _redirectToStripe() {
    //<--- prepare the JS in a normal string
    final redirectToCheckoutJs = '''
var stripe = Stripe(\'$apiKey\');
    
stripe.redirectToCheckout({
  sessionId: '${widget.sessionId}'
}).then(function (result) {
  result.error.message = 'Error'
});
''';
    _controller.evaluateJavascript(
        redirectToCheckoutJs); //<--- call the JS function on controller
  }
}

const kStripeHtmlPage = '''
<!DOCTYPE html>
<html>
<script src="https://js.stripe.com/v3/"></script>
<head><title>Stripe checkout</title>
 

</head>
<body>
 
<h3>Please wait for a moment...</h3>
 
</body>
</html>
''';
