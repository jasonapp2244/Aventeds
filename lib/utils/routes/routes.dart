import 'package:flutter/material.dart';
import 'package:provide/utils/routes/routes_name.dart';
import 'package:provide/view/home_screen/homeview.dart';
import 'package:provide/view/loginview.dart';
import 'package:provide/view/role_selector.dart';
import 'package:provide/view/sginupview.dart';
import 'package:provide/view/splashview.dart';
import 'package:provide/view/event_screen/home_screen_view.dart';
import 'package:provide/view/main_screen.dart';

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
          builder: (BuildContext context) => Sginupview(),
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
