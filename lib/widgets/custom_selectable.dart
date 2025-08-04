import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provide/res/components/app_color.dart';

class CustomSelectableTag extends StatelessWidget {
  final String title;
  final bool isSelected;

  const CustomSelectableTag({
    Key? key,
    required this.title,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: isSelected ? AppColor.yellow : Colors.grey[600]!,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          color: isSelected ? AppColor.textColor : AppColor.textColorWith50,
          fontSize: 8,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
    );
  }
}
