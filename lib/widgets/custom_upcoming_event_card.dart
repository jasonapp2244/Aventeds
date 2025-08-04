import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provide/res/components/app_color.dart';
import 'package:provide/utils/routes/responsive.dart';
import 'package:provide/widgets/custom_stack_image.dart';

class CustomUpcomingEventCard extends StatelessWidget {
  final String title;
  final String speakerName;
  final String timeSlot;
  final List<String> tags;
  final List<String> speakerImagePaths;
  final Color backgroundColor;
  final VoidCallback? onJoinTap;
  final VoidCallback? onCardTap;

  const CustomUpcomingEventCard({
    super.key,
    required this.title,
    required this.speakerName,
    required this.timeSlot,
    required this.tags,
    required this.speakerImagePaths,
    this.backgroundColor = const Color(0xFFEDC018), // Default yellow
    this.onJoinTap,
    this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    return GestureDetector(
      onTap: onCardTap,
      child: Container(
        padding: EdgeInsets.only(top: 5, bottom: 10, left: 10, right: 10),
        height: 400,
        width: double.infinity,
        margin: EdgeInsets.only(right: 5),

        decoration: BoxDecoration(
          color: AppColor.yellow,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xffF2D97F),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Dropdown
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AppColor.tertiaryColor,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColor.primaryColor,
                        size: 24,
                      ),
                    ],
                  ),

                  // Speaker Name
                  const SizedBox(height: 4),
                  Text(
                    speakerName,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff444444),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Tags
                  Wrap(
                    spacing: 8,
                    children: tags.map((tag) => _buildTag(tag)).toList(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Speaker Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Speaker',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff444444),
                  ),
                ),

                SizedBox(
                  width: 80, // or whatever fits your design
                  child: ImageStackWidget(images: speakerImagePaths),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Time Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 16,
                      color: AppColor.primaryColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Today',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff444444),
                      ),
                    ),
                  ],
                ),

                Text(
                  timeSlot,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff444444),
                  ),
                ),
              ],
            ),

            Spacer(),

            // Join Now Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.tertiaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 0,
                ),

                child: Text(
                  'Join Now',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String tag) {
    bool isMotionTag = tag.toLowerCase() == 'motion';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isMotionTag
            ? AppColor.tertiaryColor
            : Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
        border: !isMotionTag
            ? Border.all(color: AppColor.primaryColor.withOpacity(0.3))
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isMotionTag) ...[
            Icon(Icons.play_circle_outline, size: 14, color: Colors.white),
            const SizedBox(width: 4),
          ],
          Text(
            tag,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isMotionTag ? Colors.white : AppColor.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
