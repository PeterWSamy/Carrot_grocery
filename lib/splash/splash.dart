import 'package:carrot/view/main_screen.dart';
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
      await Future.delayed(const Duration(seconds: 2),(){});
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const MainPage()));
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(child: Image.asset("assets/images/splash.png")),
    );
  }
}