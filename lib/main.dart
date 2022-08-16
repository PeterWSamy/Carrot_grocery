import 'package:flutter/material.dart';

import 'package:carrot/Screens/login.dart';
import 'routes/generator.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carrot',
      theme: ThemeData(
        fontFamily: "Noto Sans",
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(255, 82, 205, 109),
        ),
      ),
      home: const Login(),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
class Login extends StatefulWidget{
  const Login({Key? key}):super(key: key);
  @override
  State<Login> createState() => LoginPage();
}

