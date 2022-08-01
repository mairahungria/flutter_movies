import 'package:flutter/material.dart';
import '../../../shared/resources/colors.dart';
import '../../../shared/resources/sizes.dart';
import '../../../shared/resources/strings.dart';

class ReturnButton extends StatelessWidget {
  const ReturnButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 24,
      left: 20,
      child: ElevatedButton(
        onPressed: () => Navigator.pop(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              const RotatedBox(
                quarterTurns: 3,
                child: Icon(
                  Icons.expand_less,
                  color: Colours.buttonContentColor,
                ),
              ),
              const SizedBox(width: 1),
              Text(
                Strings.returnButtonText,
                style: TextStyle(
                  color: Colours.buttonContentColor,
                  fontSize: sizes.smallTextSize(context),
                ),
              ),
            ],
          ),
        ),
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.only(left: 4, right: 13),
          ),
          minimumSize: MaterialStateProperty.all(Size.zero),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) => Colours.white,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          elevation: MaterialStateProperty.all(3),
          shadowColor: MaterialStateProperty.all(Colors.grey[50]),
        ),
      ),
    );
  }
}