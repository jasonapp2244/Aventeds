import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aventeds/res/components/app_color.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final Color iconColor;
  final Color textColor;
  final Color hintColor;

  const CustomSearchField({
    super.key,
    required this.controller,
    this.hintText = 'Search',
    this.onChanged,
    this.onTap,
    this.backgroundColor = const Color(0xFF424242), // Colors.grey[800]
    this.iconColor = Colors.white,
    this.textColor = Colors.white,
    this.hintColor = const Color(0xFFBDBDBD), // Colors.grey[400]
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xff1E1E1E),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: iconColor, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              onTap: onTap,
              style: GoogleFonts.poppins(color: textColor, fontSize: 14),
              cursorColor: textColor,
              decoration: InputDecoration(
                filled: true,
                iconColor: Color(0xff171A1F),
                fillColor: Color(0xff1E1E1E),

                hintText: hintText,
                hintStyle: GoogleFonts.poppins(
                  color: Color(0xffBCC1CA),
                  fontSize: 14,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
