import 'package:flutter/material.dart';
import '../../../shared/resources/colors.dart';
import '../../../shared/resources/sizes.dart';

class InfoText extends StatelessWidget {
  const InfoText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: TextStyle(
        color: Colours.textColor,
        fontWeight: FontWeight.w600,
        fontSize: sizes.smallTextSize(context),
      ),
    );
  }
}