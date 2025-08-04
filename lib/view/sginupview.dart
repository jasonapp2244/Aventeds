import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provide/res/components/app_color.dart';
import 'package:provide/res/components/auth_button.dart';
import 'package:provide/utils/routes/responsive.dart';
import 'package:provide/utils/routes/routes_name.dart';
import 'package:provide/utils/routes/utils.dart';

class Sginupview extends StatefulWidget {
  const Sginupview({super.key});

  @override
  State<Sginupview> createState() => _SginupviewState();
}

class _SginupviewState extends State<Sginupview> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFoucsNode = FocusNode();
  FocusNode phoneFoucsNode = FocusNode();
  FocusNode passwordFoucsNode = FocusNode();
  FocusNode sumbitFoucsNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordFoucsNode.dispose();
    emailFoucsNode.dispose();
    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Initialize responsive class
    Responsive.init(context);
    // final authViewmodel = Provider.of<AuthViewmodel>(context);

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.w(5), // 5% of screen width
            vertical: Responsive.h(2), // 2% of screen height
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Responsive.h(2)), // 2% of screen height
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // SvgPicture.asset(
                    //   "assets/images/login.svg",
                    //   width: Responsive.w(25), // 50% of screen width
                    // ),
                    Image(image: AssetImage("assets/images/login.png")),
                  ],
                ),
                SizedBox(height: Responsive.h(2)),
                Text(
                  "Create Your Account",
                  style: GoogleFonts.rethinkSans(
                    color: AppColor.textColor,
                    fontWeight: FontWeight.w900,
                    fontSize: Responsive.sp(25), // Responsive font size
                  ),
                ),
                SizedBox(height: Responsive.h(1)),
                Text(
                  "Create your account to explore about our app",
                  style: GoogleFonts.rethinkSans(
                    color: AppColor.textColor,
                    fontWeight: FontWeight.normal,
                    fontSize: Responsive.sp(10.5),
                  ),
                ),
                SizedBox(height: Responsive.h(3)),
                TextFormField(
                  style: TextStyle(color: AppColor.textColor),
                  controller: emailController,
                  focusNode: emailFoucsNode,
                  cursorColor: AppColor.seconadryColor,
                  cursorErrorColor: AppColor.seconadryColor,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        Responsive.w(12),
                      ), // 6% of width
                      borderSide: BorderSide(color: AppColor.yellow),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Responsive.w(12)),
                      borderSide: BorderSide(color: AppColor.yellow),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.yellow),
                      borderRadius: BorderRadius.circular(Responsive.w(12)),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(Responsive.w(3)), // 2% of width
                      child: SvgPicture.asset(
                        "assets/icons/user-multiple-02 (2).svg",
                      ),
                    ),
                    filled: true,
                    fillColor: AppColor.primaryColor.withValues(alpha: 0.08),
                    hintText: "Full Name",
                    hintStyle: GoogleFonts.dmSans(
                      color: AppColor.textColor,
                      fontWeight: FontWeight.normal,
                      fontSize: Responsive.sp(12),
                    ),
                  ),
                  onFieldSubmitted: (value) {
                    Utils.fieldFoucsChange(
                      context,
                      emailFoucsNode,
                      passwordFoucsNode,
                    );
                  },
                ),
                SizedBox(height: Responsive.h(2)),
                //
                TextFormField(
                  style: TextStyle(color: AppColor.textColor),
                  controller: phoneController,
                  focusNode: phoneFoucsNode,
                  cursorColor: AppColor.seconadryColor,
                  cursorErrorColor: AppColor.seconadryColor,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        Responsive.w(12),
                      ), // 6% of width
                      borderSide: BorderSide(color: AppColor.yellow),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Responsive.w(12)),
                      borderSide: BorderSide(color: AppColor.yellow),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.yellow),
                      borderRadius: BorderRadius.circular(Responsive.w(12)),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(Responsive.w(3)), // 2% of width
                      child: SvgPicture.asset("assets/icons/mail-02.svg"),
                    ),
                    filled: true,
                    fillColor: AppColor.primaryColor.withValues(alpha: 0.08),
                    hintText: "Email Adress",
                    hintStyle: GoogleFonts.dmSans(
                      color: AppColor.textColor,
                      fontWeight: FontWeight.normal,
                      fontSize: Responsive.sp(12),
                    ),
                  ),
                  onFieldSubmitted: (value) {
                    Utils.fieldFoucsChange(
                      context,
                      emailFoucsNode,
                      phoneFoucsNode,
                    );
                  },
                ),

                SizedBox(height: Responsive.h(2)),
                ValueListenableBuilder(
                  valueListenable: _obsecurePassword,
                  builder: (context, value, child) {
                    return TextFormField(
                      style: TextStyle(color: AppColor.textColor),
                      controller: passwordController,
                      focusNode: passwordFoucsNode,
                      cursorColor: AppColor.seconadryColor,
                      cursorErrorColor: AppColor.seconadryColor,
                      obscureText: _obsecurePassword.value,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        focusColor: AppColor.textColor,
                        filled: true,
                        fillColor: AppColor.primaryColor.withValues(
                          alpha: 0.08,
                        ),
                        hintText: "Password",
                        hintStyle: GoogleFonts.dmSans(
                          color: AppColor.textColor,
                          fontWeight: FontWeight.normal,
                          fontSize: Responsive.sp(12),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Responsive.w(12)),
                          borderSide: BorderSide(color: AppColor.yellow),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Responsive.w(12)),
                          borderSide: BorderSide(color: AppColor.yellow),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.yellow),
                          borderRadius: BorderRadius.circular(Responsive.w(12)),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(Responsive.w(3)),
                          child: SvgPicture.asset(
                            "assets/icons/lock-password (3).svg",
                          ),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            _obsecurePassword.value = !_obsecurePassword.value;
                          },
                          child: Icon(
                            _obsecurePassword.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: _obsecurePassword.value
                                ? AppColor.textColor
                                : AppColor.seconadryColor,
                            size: Responsive.sp(18),
                          ),
                        ),
                      ),
                    );
                  },
                ),

                SizedBox(height: Responsive.h(2.5)),
                AuthButton(
                  buttontext: "Sign Up",
                  loading: false,
                  onPress: () {
                    if (emailController.text.isEmpty) {
                      Utils.tosatMassage("Please Enter Email First");
                    } else if (passwordController.text.isEmpty) {
                      Utils.tosatMassage("Please Enter Password First");
                    } else if (passwordController.text.length < 8) {
                      Utils.tosatMassage("Please Enter 8 digits");
                    } else {
                      Navigator.pushReplacementNamed(
                        context,
                        RoutesName.roleselector,
                      );
                      // Navigate to

                      // Map<String, String> headr = {
                      //   "x-api-key": "reqres-free-v1",
                      // };
                      // Map data = {
                      //   'email': emailController.text.toString(),
                      //   'password': passwordController.text.toString(),
                      // };
                      // // authViewmodel.loginApi(data, headr, context);
                    }
                  },
                ),
                SizedBox(height: Responsive.h(2)),
                Row(
                  children: [
                    Expanded(child: Divider(color: AppColor.textColor)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Responsive.w(3),
                      ),
                      child: Text(
                        "OR",
                        style: GoogleFonts.dmSans(
                          color: AppColor.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: Responsive.sp(10),
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: AppColor.textColor)),
                  ],
                ),
                SizedBox(height: Responsive.h(2)),
                Column(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildSocialButton(
                      'assets/icons/google.svg',
                      "Continue With Google",
                    ),
                    // _buildSocialButton("assets/icons/google.svg","Continue With Google"),
                    _buildSocialButton(
                      "assets/icons/facebook.svg",
                      "Continue With Facebook",
                    ),
                    _buildSocialButton(
                      "assets/icons/apple.svg",
                      "Continue With Apple",
                    ),
                  ],
                ),
                SizedBox(height: Responsive.h(2)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        text: "Have an account? ",
                        style: TextStyle(
                          color: AppColor.textColor,
                          fontSize: Responsive.sp(12),
                        ),
                        children: [
                          TextSpan(
                            text: "Login here",
                            style: TextStyle(
                              color: AppColor.seconadryColor,
                              fontSize: Responsive.sp(12),
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  RoutesName.login,
                                );

                                // Navigator.pushReplacementNamed(
                                //   context,
                                //   RoutesName.loginview,
                                // );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(String iconPath, String text) {
    return Container(
      height: Responsive.h(6), // 6% of screen height
      width: double.infinity, // 20% of screen width
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: AppColor.yellow),
        borderRadius: BorderRadius.circular(Responsive.w(5.5)),
        color: AppColor.primaryColor.withValues(alpha: 0.08),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(Responsive.w(3)),
          child: Row(
            children: [
              SizedBox(width: Responsive.w(15)),
              // Row(children: [  SvgPicture.asset(iconPath),],),
              SvgPicture.asset(iconPath), SizedBox(width: Responsive.w(3)),
              Text(text, style: GoogleFonts.dmSans(color: AppColor.textColor)),
            ],
          ),
        ),
      ),
    );
  }
}
