import 'package:flutter/material.dart';
import 'package:aventeds/utils/routes/routes_name.dart';
import 'package:aventeds/view/home_screen/homeview.dart';
import 'package:aventeds/view/loginview.dart';
import 'package:aventeds/view/role_selector.dart';
import 'package:aventeds/view/sginupview.dart';
import 'package:aventeds/view/splashview.dart';
import 'package:aventeds/view/event_screen/home_screen_view.dart';
import 'package:aventeds/view/main_screen.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings setting) {
    // setting.arguments;
    switch (setting.name) {
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (BuildContext context) => HomeScreenView(),
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (BuildContext context) => Loginview(),
        );
      case RoutesName.signup:
        return MaterialPageRoute(
          builder: (BuildContext context) => SginupView(),
        );
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (BuildContext context) => SplashView(),
        );
      case RoutesName.roleselector:
        return MaterialPageRoute(
          builder: (BuildContext context) => RoleSelectionScreen(),
        );

      default:
        RoutesName.home;
        return MaterialPageRoute(
          builder: (BuildContext context) => HomeScreenView(),
        );
    }
  }
}
