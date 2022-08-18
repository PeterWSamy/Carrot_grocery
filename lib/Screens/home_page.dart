import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 190,
                    width: 320,
                    child: Image.asset("assets/images/Campaign.png"),
                  ),
                ),
              ),
              
            ],
          ),
      );
  }
}
