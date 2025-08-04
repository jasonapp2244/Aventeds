import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provide/res/components/app_color.dart';
import 'package:provide/res/components/auth_button.dart';
import 'package:provide/utils/routes/responsive.dart';
import 'package:provide/view/homeview.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  String selectedRole = "User";

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Responsive.h(2)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(image: AssetImage("assets/icons/splash.png")),
                  ],
                ),
                SizedBox(height: Responsive.h(2)),

                Text(
                  'Select Your Role',
                  style: GoogleFonts.onest(
                    fontSize: 32,
                    color: AppColor.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: Responsive.h(5)),
                // Text(
                //   'Select your role to customize your learning experience.',
                //   style: GoogleFonts.rethinkSans(
                //     fontSize: 16,
                //     color: AppColor.white,
                //   ),
                // ),
                // const SizedBox(height: 20),
                // Fighter option
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RoleSelectionCard(
                      svgImage: "assets/icons/advertising_4318884 1 (1).svg",
                      title: "User",
                      isSelected: selectedRole == "user",
                      onTap: () {
                        setState(() {
                          selectedRole = "user";
                        });
                      },
                    ),
                    SizedBox(height: Responsive.h(2)),

                    // Promoter option
                    RoleSelectionCard(
                      svgImage: "assets/icons/boxing.svg",
                      title: "Artist",
                      isSelected: selectedRole == "Artist",
                      onTap: () {
                        setState(() {
                          selectedRole = "Artist";
                        });
                      },
                    ),
                    SizedBox(height: Responsive.h(2)),

                    RoleSelectionCard(
                      svgImage: "assets/icons/boxing.svg",
                      title: "Producer",
                      isSelected: selectedRole == "Producer",
                      onTap: () {
                        setState(() {
                          selectedRole = "Producer";
                        });
                      },
                    ),
                    SizedBox(height: Responsive.h(2)),

                    RoleSelectionCard(
                      svgImage: "assets/icons/boxing.svg",
                      title: "DJ",
                      isSelected: selectedRole == "DJ",
                      onTap: () {
                        setState(() {
                          selectedRole = "DJ";
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: Responsive.h(15)),

                // const Spacer(),
                AuthButton(
                  buttontext: "Next",
                  loading: false,
                  onPress: () {
                    // selectedRole == null
                    //     ? null
                    //     : () {
                    // Proceed with the selected role
                    print('Selected role: $selectedRole');
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => Homeview()),
                    );
                    // Navigator.pushNamed(context, RoutesName.homeview);
                    // };
                  },
                ),

                // ElevatedButton(
                //   onPressed:
                //       selectedRole == null
                //           ? null
                //           : () {
                //             // Proceed with the selected role
                //             print('Selected role: $selectedRole');
                //             // Navigator.pushNamed(context, RoutesName.homeview);
                //           },
                //   style: ElevatedButton.styleFrom(
                //     // backgroundColor: AppColor.red,
                //     foregroundColor: AppColor.fillColor,
                //     minimumSize: const Size(double.infinity, 50),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(22),
                //     ),
                //   ),
                //   child: const Text('Next', style: TextStyle(fontSize: 18)),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RoleSelectionCard extends StatelessWidget {
  final String title;
  final String svgImage;
  final bool isSelected;
  final VoidCallback onTap;

  const RoleSelectionCard({
    required this.title,
    required this.isSelected,
    required this.svgImage,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        // height: 120,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColor.textColor.withValues(alpha: 0.15),
          // color: isSelected ? AppColor.blueColor : AppColor.fillColor,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: isSelected ? AppColor.seconadryColor : AppColor.primaryColor,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(svgImage.toString()),
            Text(
              title,
              style: GoogleFonts.rethinkSans(
                fontWeight: FontWeight.bold,
                color: AppColor.textColor,
              ),
            ),
          ],
        ),

        //  Center(
        //   child: Text(
        //     title,
        //     style: TextStyle(
        //       fontSize: 18,
        //       fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        //       color: isSelected ? Colors.black : Colors.grey.shade600,
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
