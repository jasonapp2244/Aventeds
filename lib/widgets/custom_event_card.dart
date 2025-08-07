import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aventeds/res/components/app_color.dart';
import 'package:aventeds/utils/routes/responsive.dart';

class CustomEventCard extends StatelessWidget {
  final String title;
  final String date;
  final String imagePath;
  final List<String> speakerImagePaths;
  final VoidCallback? onTap;

  const CustomEventCard({
    super.key,
    required this.title,
    required this.date,
    required this.imagePath,
    required this.speakerImagePaths,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(right: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white, width: 2),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Stack(
            children: [
              // Gradient overlay
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
              ),

              // Title at top
              Positioned(
                left: 12,
                top: 12,
                right: 12,
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColor.yellow,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              // Bottom section with date, speaker, and avatars
              Positioned(
                left: 12,
                right: 12,
                bottom: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      date,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Speaker',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // Image stack
                        speakerImagePaths.isNotEmpty
                            ? SizedBox(
                                height: 28,
                                width: 60,
                                child: Stack(
                                  children: List.generate(
                                    speakerImagePaths.length > 3
                                        ? 3
                                        : speakerImagePaths.length,
                                    (index) {
                                      return Positioned(
                                        left: index * 16.0,
                                        child: CircleAvatar(
                                          radius: 14,
                                          backgroundColor: Colors.white,
                                          backgroundImage: AssetImage(
                                            speakerImagePaths[index],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )
                            : const SizedBox(width: 60, height: 28),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
