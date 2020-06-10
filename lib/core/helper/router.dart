import 'package:dribbble_clone/view/start_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Router {
  static const String initialRoute = StartView.routeName;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case StartView.routeName:
        return MaterialPageRoute(builder: (_) => StartView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
