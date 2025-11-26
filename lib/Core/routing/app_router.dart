import 'package:coin_gecko/Core/routing/routes.dart';
import 'package:coin_gecko/mod/Home/presentation/home_screen.dart';
import 'package:flutter/cupertino.dart';

class AppRouter {
  static const String initialRoute = '/';

  Route<dynamic>? generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case Routes.homeScreen:
        return CupertinoPageRoute(builder: (_) => const HomeScreen());
      default:
        return null;
    }
  }
}
