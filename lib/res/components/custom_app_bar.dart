import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:aventeds/res/components/app_color.dart';
import 'package:aventeds/utils/routes/responsive.dart';

class CustomAppBar extends StatelessWidget {
  final String? profileImagePath;
  final int notificationCount;
  final VoidCallback? onProfileTap;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onMenuTap;

  const CustomAppBar({
    super.key,
    this.profileImagePath,
    this.notificationCount = 0,
    this.onProfileTap,
    this.onNotificationTap,
    this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Profile Picture
          GestureDetector(
            onTap: onProfileTap,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: AppColor.tertiaryColor,
              backgroundImage: profileImagePath != null
                  ? AssetImage(profileImagePath!)
                  : null,
              child: profileImagePath == null
                  ? Icon(Icons.person, color: AppColor.textColor, size: 24)
                  : null,
            ),
          ),

          // Notifications and Menu
          Row(
            children: [
              GestureDetector(
                onTap: onNotificationTap,
                child: badges.Badge(
                  showBadge: notificationCount > 0,
                  badgeContent: Text(
                    notificationCount.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  badgeStyle: badges.BadgeStyle(
                    badgeColor: Colors.red,
                    padding: EdgeInsets.all(4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.notifications,
                    color: AppColor.textColor,
                    size: 24,
                  ),
                ),
              ),
              SizedBox(width: Responsive.w(4)),
              GestureDetector(
                onTap: onMenuTap,
                child: Icon(Icons.menu, color: AppColor.textColor, size: 24),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
