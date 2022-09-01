import 'package:carrot/view/Cart/widgets/backhome.dart';
import 'package:carrot/view/Cart/widgets/checkout_button.dart';
import 'package:flutter/material.dart';

import '../../res/strings.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 33),
            child: Image.asset("assets/images/checkout.png"),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(60, 0, 50, 16),
            child: Text(
              StringConstants.checkoutMessageMain,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            width: 253,
            child: Text(
              StringConstants.checkoutMessageSub,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black38,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children:const [
                SizedBox(width: double.infinity,child: CheckoutButton()),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(width: double.infinity,child: BackHome()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
