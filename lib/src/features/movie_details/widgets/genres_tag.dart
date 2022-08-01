import 'package:flutter/material.dart';
import '../../../shared/resources/colors.dart';
import '../../../shared/resources/sizes.dart';

class GenresTags extends StatelessWidget {
  const GenresTags({
    Key? key,
    required this.genre,
  }) : super(key: key);

  final String genre;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colours.borderColor,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 10,
        ),
        child: Text(
          genre,
          style: TextStyle(
            color: Colours.secondaryTextColor,
            fontSize: sizes.mediumTextSize(context),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}