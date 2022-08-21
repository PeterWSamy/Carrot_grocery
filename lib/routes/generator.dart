import 'package:carrot/view/home.dart';
import 'package:carrot/view/home_pages/products_page.dart';
import 'package:flutter/material.dart';
import 'package:carrot/view/login_signup/login.dart';
import 'package:carrot/view/login_signup/signup.dart';

import '../view/login_signup/signup.dart';

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
      case '/products':
        // Validation of correct data type
        return MaterialPageRoute(
          builder: (context) => ProductsPage(),
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
