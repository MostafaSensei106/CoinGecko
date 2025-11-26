import 'package:flutter/cupertino.dart';

import '../../modules/home/presentation/home_screen.dart';
import 'routes.dart';

class AppRouter {
  static const String initialRoute = '/';

  Route<dynamic>? generateRoute(final RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case Routes.homeScreen:
        return CupertinoPageRoute(builder: (_) => const HomeScreen());
      default:
        return null;
    }
  }
}
