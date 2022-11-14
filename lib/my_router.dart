import 'package:code_kata_demo/lifecycle.dart';
import 'package:code_kata_demo/my_home_page.dart';
import 'package:code_kata_demo/my_profile.dart';
import 'package:flutter/material.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MyHomePage());

      case '/profile':
        dynamic args;
        // Getting arguments passed in while calling Navigator.pushNamed
        if (settings.arguments != null) {
          args = settings.arguments as MyProfile;
        } else {
          args = "";
        }
        if (args.userName.isNotEmpty) {
          return MaterialPageRoute(
            builder: (_) => MyProfile(
              userName: args.userName,
              pwd: args.pwd,
            ),
          );
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();

      case '/lifecycle':
        // Getting arguments passed in while calling Navigator.pushNamed
        dynamic lifecycleArgs;

        if (settings.arguments != null) {
          lifecycleArgs = settings.arguments as String;
        } else {
          lifecycleArgs = "default";
        }

        return MaterialPageRoute(
          builder: (_) => Lifecycle(
            value: lifecycleArgs,
          ),
        );

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
