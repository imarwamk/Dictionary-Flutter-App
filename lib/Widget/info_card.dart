import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final Color backgroundColor;
  final bool isItalic;
  final Color borderColor;
  final IconData? icons;
  final VoidCallback? onIconPressed;

  const InfoCard({
    super.key,
    required this.title,
    required this.value,
    required this.backgroundColor,
    this.isItalic = false,
    required this.borderColor,
    this.icons,
    this.onIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: borderColor),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.urbanist(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: GoogleFonts.exo(
              color: Colors.white,
              fontSize: 15,
              fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (onIconPressed != null)
                IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.white),
                  onPressed: onIconPressed,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
