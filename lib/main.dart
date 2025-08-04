import 'package:flutter/material.dart';
import 'package:provide/utils/routes/routes.dart';
import 'package:provide/utils/routes/routes_name.dart';
import 'package:provide/view/event_screen/home_screen_view.dart';
import 'package:provide/view/splashview.dart';
import 'package:provide/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthViewModel())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
      // initialRoute: RoutesName.splash,
      // onGenerateRoute: Routes.generateRoutes,
    );
  }
}
