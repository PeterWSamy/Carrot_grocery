import 'package:carrot/view/home_pages/home_page.dart';
import 'package:carrot/view/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget{
  const Splash({Key? key}):super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    _navigateToHome();
  }
  _navigateToHome() async{
      await Future.delayed(Duration(seconds: 2),(){});
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => MainPage()));
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(child: Image.asset("assets/images/splash.png")),
    );
  }
}