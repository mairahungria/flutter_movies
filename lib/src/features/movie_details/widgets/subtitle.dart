import 'package:flutter/material.dart';
import '../../../shared/resources/colors.dart';
import '../../../shared/resources/sizes.dart';

class Subtitle extends StatelessWidget {
  const Subtitle({
    Key? key,
    required this.subtitle,
  }) : super(key: key);

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          subtitle,
          style: TextStyle(
            fontSize: sizes.mediumTextSize(context),
            color: Colours.secondaryTextColor,
          ),
        ),
      ),
    );
  }
}