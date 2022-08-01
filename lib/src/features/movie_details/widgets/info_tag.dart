import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../shared/resources/colors.dart';
import '../../../shared/resources/sizes.dart';

class InfoTag extends StatelessWidget {
  const InfoTag({
    Key? key,
    required this.title,
    required this.data,
    this.width,
  }) : super(key: key);

  final String title;
  final String data;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colours.boxBackgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 8,
          bottom: 10,
          left: 16,
          right: 16,
        ),
        child: RichText(
          text: TextSpan(
            style: TextStyle(
              fontFamily: GoogleFonts.montserrat().fontFamily,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.4,
            ),
            children: <TextSpan>[
              TextSpan(
                text: title,
                style: TextStyle(
                  fontSize: sizes.smallTextSize(context),
                  color: Colours.detailsSecondaryColor,
                ),
              ),
              TextSpan(
                text: data,
                style: TextStyle(
                  fontSize: sizes.mediumTextSize(context),
                  color: Colours.textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}