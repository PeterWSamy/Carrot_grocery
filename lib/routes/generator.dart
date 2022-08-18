import 'package:carrot/Screens/home.dart';
import 'package:flutter/material.dart';
import 'package:carrot/Screens/login.dart';
import 'package:carrot/Screens/signup.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/signup':
        // Validation of correct data type
        return MaterialPageRoute(
          builder: (_) => SignUp(),
        );
      case '/home':
        // Validation of correct data type
        return MaterialPageRoute(
          builder: (_) => Home(),
        );
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
