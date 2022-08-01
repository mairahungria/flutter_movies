import 'package:flutter/material.dart';

final sizes = Sizes();

class Sizes {
  double titleSize(BuildContext context) {
    return MediaQuery.of(context).size.width / 20;
  }

  double mediumTextSize(BuildContext context) {
    return MediaQuery.of(context).size.width / 25.7;
  }

  double smallTextSize(BuildContext context) {
    return MediaQuery.of(context).size.width / 30;
  }

  double extraSmallTextSize(BuildContext context) {
    return MediaQuery.of(context).size.width / 36;
  }

  double scoreTextSize(BuildContext context) {
    return MediaQuery.of(context).size.width / 15;
  }

  double appBarSize(BuildContext context) {
    return 108 + sizes.titleSize(context) + sizes.mediumTextSize(context) * 2 + sizes.smallTextSize(context) * 2.36;
  }
}
