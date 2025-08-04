import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provide/res/components/app_color.dart';
import 'package:provide/res/components/auth_button.dart';
import 'package:provide/utils/routes/responsive.dart';
import 'package:provide/view/loginview.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/welcome.svg"),
            SizedBox(height: Responsive.h(6)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt u",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(color: AppColor.textColor),
              ),
            ),
            SizedBox(height: Responsive.h(6)),

            AuthButton(
              buttontext: "Welcome",
              loading: false,
              onPress: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => Loginview()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
