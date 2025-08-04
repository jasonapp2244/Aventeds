import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provide/res/components/app_color.dart';
import 'package:provide/view/loginview.dart';
import 'package:provide/view/welcome_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    await Future.delayed(const Duration(milliseconds: 500));
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => WelcomeView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Initialize responsive values
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final iconSize = screenWidth * 0.6; // 60% of screen width

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [ SizedBox(height: screenHeight * 0.2),
              SizedBox(
                width: iconSize,
                height: iconSize,
                child: SvgPicture.asset(
                  "assets/images/splash.svg",
                  fit: BoxFit.contain,
                ),
              ),Spacer(),
              SizedBox(
                width: double.infinity,
                height: screenHeight*0.4,
                child: SvgPicture.asset(
                  "assets/images/Vector.svg",
                  fit: BoxFit.fitWidth,
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
