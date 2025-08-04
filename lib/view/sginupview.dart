import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provide/res/components/app_color.dart';
import 'package:provide/res/components/auth_button.dart';
import 'package:provide/utils/routes/responsive.dart';
import 'package:provide/utils/routes/routes_name.dart';
import 'package:provide/utils/routes/utils.dart';
import 'package:provide/view/homeview.dart';
import 'package:provide/view/loginview.dart';
import 'package:provide/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class SginupView extends StatefulWidget {
  const SginupView({super.key});

  @override
  State<SginupView> createState() => _SginupViewState();
}

class _SginupViewState extends State<SginupView> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  FocusNode emailFoucsNode = FocusNode();
  FocusNode confirmFoucsNode = FocusNode();
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
                SizedBox(height: Responsive.h(2)),
                Text(
                  "Join AVENTED  App Today",
                  style: GoogleFonts.poppins(
                    color: AppColor.tertiaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: Responsive.sp(19), // Responsive font size
                  ),
                ),
                SizedBox(height: Responsive.h(1)),
                Text(
                  "Log in to explore about our app",
                  style: GoogleFonts.poppins(
                    color: AppColor.textColor,
                    fontWeight: FontWeight.normal,
                    fontSize: Responsive.sp(10.5),
                  ),
                ),
                SizedBox(height: Responsive.h(3)),
                Text(
                  "Email",
                  style: GoogleFonts.poppins(
                    color: AppColor.textColor,
                    fontWeight: FontWeight.normal,
                    fontSize: Responsive.sp(12),
                  ),
                ),
                TextFormField(
                  style: TextStyle(color: AppColor.textColor),
                  controller: emailController,
                  focusNode: emailFoucsNode,
                  cursorColor: AppColor.yellow,
                  cursorErrorColor: AppColor.yellow,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        Responsive.w(4),
                      ), // 6% of width
                      borderSide: BorderSide(color: AppColor.yellow),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Responsive.w(4)),
                      borderSide: BorderSide(color: AppColor.yellow),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.yellow),
                      borderRadius: BorderRadius.circular(Responsive.w(4)),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(Responsive.w(3)), // 2% of width
                      child: SvgPicture.asset("assets/icons/mail.svg"),
                    ),
                    filled: true,
                    fillColor: AppColor.fillColor,
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
                SizedBox(height: Responsive.h(1)),
                Text(
                  "Password",
                  style: GoogleFonts.poppins(
                    color: AppColor.textColor,
                    fontWeight: FontWeight.normal,
                    fontSize: Responsive.sp(12),
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: _obsecurePassword,
                  builder: (context, value, child) {
                    return TextFormField(
                      style: TextStyle(color: AppColor.textColor),
                      controller: passwordController,
                      focusNode: passwordFoucsNode,
                      cursorColor: AppColor.yellow,
                      cursorErrorColor: AppColor.yellow,
                      obscureText: _obsecurePassword.value,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        focusColor: AppColor.textColor,
                        filled: true,
                        fillColor: AppColor.fillColor,
                        hintText: "Password",
                        hintStyle: GoogleFonts.dmSans(
                          color: AppColor.textColor,
                          fontWeight: FontWeight.normal,
                          fontSize: Responsive.sp(12),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Responsive.w(4)),
                          borderSide: BorderSide(color: AppColor.yellow),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Responsive.w(4)),
                          borderSide: BorderSide(color: AppColor.yellow),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.yellow),
                          borderRadius: BorderRadius.circular(Responsive.w(4)),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(Responsive.w(3)),
                          child: SvgPicture.asset("assets/icons/lock.svg"),
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
                                : AppColor.tertiaryColor,
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
                SizedBox(height: Responsive.h(1)),
                Text(
                  "Confirm Password",
                  style: GoogleFonts.poppins(
                    color: AppColor.textColor,
                    fontWeight: FontWeight.normal,
                    fontSize: Responsive.sp(12),
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: _obsecurePassword,
                  builder: (context, value, child) {
                    return TextFormField(
                      style: TextStyle(color: AppColor.textColor),
                      controller: confirmpasswordController,
                      focusNode: confirmFoucsNode,
                      cursorColor: AppColor.yellow,
                      cursorErrorColor: AppColor.yellow,
                      obscureText: _obsecurePassword.value,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        focusColor: AppColor.textColor,
                        filled: true,
                        fillColor: AppColor.fillColor,
                        hintText: "Confirm Password",
                        hintStyle: GoogleFonts.dmSans(
                          color: AppColor.textColor,
                          fontWeight: FontWeight.normal,
                          fontSize: Responsive.sp(12),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Responsive.w(4)),
                          borderSide: BorderSide(color: AppColor.yellow),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Responsive.w(4)),
                          borderSide: BorderSide(color: AppColor.yellow),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.yellow),
                          borderRadius: BorderRadius.circular(Responsive.w(4)),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(Responsive.w(3)),
                          child: SvgPicture.asset("assets/icons/lock.svg"),
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
                                : AppColor.tertiaryColor,
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
                SizedBox(height: Responsive.h(1)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        text: "Already have an account?  ",
                        style: TextStyle(
                          color: AppColor.textColor,
                          fontSize: Responsive.sp(12),
                        ),
                        children: [
                          TextSpan(
                            text: "Log in",
                            style: TextStyle(
                              color: AppColor.yellow,
                              fontSize: Responsive.sp(10),
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => Loginview(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Responsive.h(2.5)),

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
                AuthButton(
                  buttontext: "Sign up",
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
                    } else if (confirmpasswordController.text.isEmpty) {
                      Utils.flushBarErrorMassage(
                        "Please Enter Confirm Password First",
                        context,
                        // context,
                      );
                    } else if (confirmpasswordController.text !=
                        passwordController.text) {
                      Utils.flushBarErrorMassage(
                        "Password Does Not Match",
                        context,
                        // context,
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => Homeview()),
                      );
                    }
                  },
                ),
                SizedBox(height: Responsive.h(2)),
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
        border: Border.all(width: 2, color: AppColor.fillColor),
        borderRadius: BorderRadius.circular(Responsive.w(3.5)),
        color: AppColor.fillColor,
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
