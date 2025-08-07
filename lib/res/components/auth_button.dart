import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:aventeds/res/components/app_color.dart';

class AuthButton extends StatelessWidget {
  final String? buttontext;
  bool loading = false;
  final VoidCallback onPress;
  AuthButton({
    super.key,
    required this.buttontext,
    required this.loading,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColor.yellow,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Center(
            child: loading
                ? CustomLoadingAnimation()
                : Text(
                    buttontext.toString(),
                    style: GoogleFonts.dmSans(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class CustomLoadingAnimation extends StatelessWidget {
  const CustomLoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.staggeredDotsWave(
      color: Colors.white,
      size: MediaQuery.sizeOf(context).height * 0.02,
    );
  }
}
