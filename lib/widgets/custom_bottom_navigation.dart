import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provide/res/components/app_color.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;

  const CustomBottomNavigation({
    super.key,
    required this.currentIndex,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Color(0xffE8E8E8),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(
            index: 0,
            iconPath: 'assets/icons/home.svg',
            activeIconPath: 'assets/icons/home.svg',

            label: 'Home',
          ),
          _buildNavItem(
            index: 1,
            iconPath: 'assets/icons/sponsor.svg',
            activeIconPath: 'assets/icons/sponser.svg',
            label: 'Sponsor',
          ),
          _buildNavItem(
            index: 2,
            iconPath: 'assets/icons/events.svg',
            activeIconPath: 'assets/icons/events.svg',

            label: 'Events',
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String iconPath,
    required String activeIconPath,
    required String label,
  }) {
    final bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap?.call(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              isSelected ? activeIconPath : iconPath,
              height: 24,
              width: 24,
              color: isSelected ? AppColor.tertiaryColor : Colors.grey[400],
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected ? AppColor.tertiaryColor : Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
