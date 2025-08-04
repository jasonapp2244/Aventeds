import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provide/res/components/app_color.dart';
import 'package:provide/res/components/auth_button.dart';
import 'package:provide/utils/routes/responsive.dart';
import 'package:provide/utils/routes/routes_name.dart';
import 'package:provide/utils/routes/utils.dart';
import 'package:provide/view/role_selector.dart';
import 'package:provide/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class Loginview extends StatefulWidget {
  const Loginview({super.key});

  @override
  State<Loginview> createState() => _LoginviewState();
}

class _LoginviewState extends State<Loginview> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFoucsNode = FocusNode();
  FocusNode passwordFoucsNode = FocusNode();
  FocusNode sumbitFoucsNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordFoucsNode.dispose();
    emailFoucsNode.dispose();
    sumbitFoucsNode.dispose();
    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AuthViewModel>(context);

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
                // SvgPicture.asset(
                //   "assets/images/download-removebg-preview 1 (6).svg",
                //   width: Responsive.w(25), // 50% of screen width
                // ),
                Image(image: AssetImage("assets/images/login.png")),
                SizedBox(height: Responsive.h(2)),
                Text(
                  "Welcome Back!",
                  style: GoogleFonts.rethinkSans(
                    color: AppColor.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: Responsive.sp(25), // Responsive font size
                  ),
                ),
                SizedBox(height: Responsive.h(1)),
                Text(
                  "Log in to explore about our app",
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
                      child: SvgPicture.asset("assets/icons/mail-02.svg"),
                    ),
                    filled: true,
                    fillColor: AppColor.primaryColor.withValues(alpha: 0.015),
                    hintText: "Email Address",
                    hintStyle: GoogleFonts.dmSans(
                      color: AppColor.textColor,
                      fontWeight: FontWeight.normal,
                      fontSize: Responsive.sp(12),
                    ),
                  ),
                  // validator:vm.validateEmail("",context,),
                  onFieldSubmitted: (value) {
                    Utils.fieldFoucsChange(
                      context,
                      emailFoucsNode,
                      passwordFoucsNode,
                    );
                  },
                ),
                SizedBox(height: Responsive.h(3)),
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
                          alpha: 0.015,
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
                            size: Responsive.sp(20),
                          ),
                        ),
                      ),
                      onFieldSubmitted: (value) {
                        Utils.fieldFoucsChange(
                          context,
                          passwordFoucsNode,
                          sumbitFoucsNode,
                        );
                      },
                    );
                  },
                ),
                SizedBox(height: Responsive.h(1.5)),
                Padding(
                  padding: EdgeInsets.only(right: Responsive.w(5)),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot Password?",
                      style: GoogleFonts.dmSans(
                        color: AppColor.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: Responsive.sp(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Responsive.h(2.5)),
                AuthButton(
                  buttontext: "Login",
                  loading: false,
                  //  authViewmodel.loading,
                  onPress: () {
                    if (emailController.text.isEmpty) {
                      Utils.flushBarErrorMassage(
                        "Please Enter Email First",
                        context,
                      );
                    } else if (!RegExp(
                      r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
                    ).hasMatch(emailController.text)) {
                      Utils.flushBarErrorMassage(
                        "Please Enter Correct Email First",
                        context,
                      );
                    } else if (passwordController.text.isEmpty) {
                      Utils.flushBarErrorMassage(
                        "Please Enter Password First",
                        context,
                      );
                    } else if (passwordController.text.length < 8) {
                      Utils.flushBarErrorMassage(
                        "Please Enter 8 digits",
                        context,
                        // context,
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RoleSelectionScreen(),
                        ),
                      );
                      // Map<String, String> headr = {
                      //   "x-api-key": "reqres-free-v1",
                      // };
                      // Map data = {
                      //   'email': emailController.text.toString(),
                      //   'password': passwordController.text.toString(),
                      // };
                      // authViewmodel.loginApi(data, headr, context);
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
                  spacing: 5,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // SocialButton(
                    //   iconPath: 'assets/icons/google.svg',
                    //   ontap: () {},
                    // ),
                    // _buildSocialButton("assets/icons/google.svg"),
                    // Container(
                    //   height: Responsive.h(6), // 6% of screen height
                    //   width: Responsive.w(25), // 20% of screen width
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(Responsive.w(5.5)),
                    //     color: AppColor.textColor.withValues(alpha: 0.08),
                    //   ),
                    //   child: Padding(
                    //     padding: EdgeInsets.all(Responsive.w(3)),
                    //     child: SvgPicture.asset("assets/icons/facebook.svg"),
                    //   ),
                    // ),
                    _buildSocialButton(
                      "assets/icons/google.svg",
                      "Continue With Google",
                    ),
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
                        text: "New here? ",
                        style: TextStyle(
                          color: AppColor.textColor,
                          fontSize: Responsive.sp(12),
                        ),
                        children: [
                          TextSpan(
                            text: "Create an account",
                            style: TextStyle(
                              color: AppColor.seconadryColor,
                              fontSize: Responsive.sp(12),
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  RoutesName.signup,
                                );

                                // Navigator.pushReplacementNamed(
                                //   context,
                                //   RoutesName.signup,
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
        color: AppColor.primaryColor,
        // AppColor.textColor.withValues(alpha: 0.08),
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
