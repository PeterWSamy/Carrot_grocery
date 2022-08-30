import 'package:carrot/view/home_pages/home.dart';
import 'package:carrot/view/home_pages/category_page.dart';
import 'package:carrot/view/home_pages/product_details.dart';
import 'package:flutter/material.dart';
import 'package:carrot/view/login_signup/login.dart';
import 'package:carrot/view/login_signup/signup.dart';

import '../view/Cart/cart_page.dart';
import '../view/login_signup/signup.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/signup':
        //new route
        return MaterialPageRoute(
          builder: (_) => SignUp(),
        );
      case '/home':
        //new route
        return MaterialPageRoute(
          builder: (_) => const Home(),
        );
      case '/products':
        //new route
        return MaterialPageRoute(
          builder: (context) => const ProductsPage(),
        );
      case '/product_details':
        return MaterialPageRoute(
          builder: (context) => ProductDetails(),
        );
      case '/cart':
        //new route
        return MaterialPageRoute(
          builder: (context) => const CartPage(),
        );
      
      
        // If args is not of the correct type, return an error page.
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
