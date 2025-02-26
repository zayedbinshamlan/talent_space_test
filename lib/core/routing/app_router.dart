import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:talent_space_test/features/auth/Presentation/screens/sign_in_screen.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // this arguments to be passed in any screen like this (arguments as Class Name)
    // final arguments = settings.arguments;

    final isIOS = defaultTargetPlatform == TargetPlatform.iOS;
    switch (settings.name) {

      case Routes.signInScreen:
        return _buildRoute(SignInScreen(), isIOS);
   
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
              body: Center(
            child: Text('No route defined for ${settings.name}'),
          )),
        );
    }
  }

  static Route<dynamic> _buildRoute(Widget widget, bool isIOS) {
    return isIOS
        ? CupertinoPageRoute(builder: (_) => widget)
        : MaterialPageRoute(builder: (_) => widget);
  }
}
