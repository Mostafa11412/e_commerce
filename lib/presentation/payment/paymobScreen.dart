// ignore_for_file: must_be_immutable

import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class PayMobScreen extends StatefulWidget {
  const PayMobScreen({Key? key}) : super(key: key);

  @override
  _PayMobScreenState createState() => _PayMobScreenState();
}

class _PayMobScreenState extends State<PayMobScreen> {
  late InAppWebViewController webViewController;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    String paymentKey = arguments["paymentKey"];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutesNames.homeScreen,
              (route) => false,
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(
              url: WebUri.uri(
                Uri.parse(
                  "https://accept.paymob.com/api/acceptance/iframes/886556?payment_token=$paymentKey",
                ),
              ),
            ),
            onWebViewCreated: (controller) {
              webViewController = controller;
            },
            onLoadStart: (controller, url) {
              setState(() {
                isLoading = true;
              });
            },
            onLoadStop: (controller, url) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          if (isLoading)
            Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ),
        ],
      ),
    );
  }
}
