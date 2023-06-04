import 'dart:js';

import 'package:ecommerce_app/utils/routes_name.dart';
import 'package:ecommerce_app/views/auth/sign_in_auth.dart';
import 'package:ecommerce_app/views/auth/sign_up_auth.dart';
import 'package:ecommerce_app/views/components/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.bottomBar:
        return MaterialPageRoute(
            builder: (context) => const BottomNavigationBarr());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (context) => const SignInWithGoogle());
      case RoutesName.register:
        return MaterialPageRoute(
          builder: (context) => const SignUpAuth(),
        );
      case RoutesName.cart:
        return MaterialPageRoute(
          builder: (context) => const SignUpAuth(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text('No routes define!'),
              ),
            );
          },
        );
    }
  }
}
