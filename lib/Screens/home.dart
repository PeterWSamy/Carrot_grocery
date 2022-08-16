import 'package:carrot/main.dart';

import 'package:flutter/material.dart';

class Home extends State<Login>{
  Home({Key? key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        actions: [
          Image.asset("assets/Logo.png"),
          const Icon(Icons.map_sharp),
        ],
      ),
    );
  }
}