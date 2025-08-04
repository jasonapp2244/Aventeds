import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provide/utils/routes/responsive.dart';

class Button extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String title;
  final VoidCallback onTap;
  final bool isLoading;
  final IconData? icon;
  final double elevation;
  final double? width;
  final double? height;
  final double horizontalPadding;
  final double verticalPadding;
  final double borderRadius;
  final bool expandWidth;
  final MainAxisAlignment contentAlignment;

  const Button({
    super.key,
    required this.color,
    required this.title,
    required this.textColor,
    required this.onTap,
    this.isLoading = false,
    this.icon,
    this.elevation = 6.0,
    this.width,
    this.height,
    this.horizontalPadding = 5,
    this.verticalPadding = 1.2,
    this.borderRadius = 3,
    this.expandWidth = true,
    this.contentAlignment = MainAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    return Material(
      elevation: elevation,
      color: color,
      borderRadius: BorderRadius.circular(Responsive.w(borderRadius)),
      child: InkWell(
        onTap: isLoading ? null : onTap,
        borderRadius: BorderRadius.circular(Responsive.w(borderRadius)),
        child: Container(
          height: height ?? Responsive.h(7),
          width: expandWidth ? (width ?? Responsive.w(90)) : null,
          constraints: expandWidth ? null : BoxConstraints(minWidth: Responsive.w(30)),
          padding: EdgeInsets.symmetric(
            vertical: Responsive.h(verticalPadding),
            horizontal: Responsive.w(horizontalPadding),
          ),
          child: Center(
            child: isLoading
                ? SizedBox(
                    width: Responsive.w(5),
                    height: Responsive.w(5),
                    child: CircularProgressIndicator(
                      color: textColor,
                      strokeWidth: 2,
                    ),
                  )
                : Row(
                    mainAxisAlignment: contentAlignment,
                    mainAxisSize: expandWidth ? MainAxisSize.max : MainAxisSize.min,
                    children: [
                      if (icon != null) ...[
                        Icon(
                          icon,
                          color: textColor,
                          size: Responsive.sp(16),
                        ),
                        SizedBox(width: Responsive.w(2)),
                      ],
                      Flexible(
                        child: Text(
                          title,
                          style: GoogleFonts.poppins(
                            color: textColor,
                            fontWeight: FontWeight.normal,
                            fontSize: Responsive.sp(12),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
