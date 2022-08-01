import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../shared/resources/sizes.dart';
import '../../../shared/resources/colors.dart';
import '../../../shared/resources/strings.dart';
import '../controllers/home_controller.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    final size = sizes.mediumTextSize(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: size * 2,
        child: TextField(
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.w400,
            color: Colours.secondaryTextColor,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 15, bottom: 13),
            isCollapsed: true,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.34),
              child: SizedBox(
                height: size * 0.7,
                width: size * 0.7,
                child: CustomPaint(
                  size: Size(size * 0.7, size * 0.7),
                  painter: MagnifyingGlass(),
                ),
              ),
            ),
            prefixIconConstraints: BoxConstraints(
              minWidth: size * 0.7,
              minHeight: size * 0.7,
            ),
            isDense: true,
            filled: true,
            fillColor: Colours.boxBackgroundColor,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              borderSide: BorderSide.none,
            ),
            hintText: Strings.hintText,
            hintStyle: const TextStyle(height: 0),
          ),
          onSubmitted: (query) {
            controller.searchContent(query);
          },
        ),
      ),
    );
  }
}

class MagnifyingGlass extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.9623857, size.height * 0.8947643);
    path.lineTo(size.width * 0.7857143, size.height * 0.7195286);
    path.cubicTo(
        size.width * 0.8542929,
        size.height * 0.6340214,
        size.width * 0.8875000,
        size.height * 0.5254921,
        size.width * 0.8785143,
        size.height * 0.4162543);
    path.cubicTo(
        size.width * 0.8695286,
        size.height * 0.3070164,
        size.width * 0.8190357,
        size.height * 0.2053729,
        size.width * 0.7374071,
        size.height * 0.1322229);
    path.cubicTo(
        size.width * 0.6557814,
        size.height * 0.05907371,
        size.width * 0.5492307,
        size.height * 0.01997864,
        size.width * 0.4396650,
        size.height * 0.02297679);
    path.cubicTo(
        size.width * 0.3300993,
        size.height * 0.02597486,
        size.width * 0.2258457,
        size.height * 0.07083829,
        size.width * 0.1483421,
        size.height * 0.1483421);
    path.cubicTo(
        size.width * 0.07083829,
        size.height * 0.2258457,
        size.width * 0.02597486,
        size.height * 0.3300993,
        size.width * 0.02297679,
        size.height * 0.4396650);
    path.cubicTo(
        size.width * 0.01997864,
        size.height * 0.5492307,
        size.width * 0.05907371,
        size.height * 0.6557814,
        size.width * 0.1322229,
        size.height * 0.7374071);
    path.cubicTo(
        size.width * 0.2053729,
        size.height * 0.8190357,
        size.width * 0.3070164,
        size.height * 0.8695286,
        size.width * 0.4162543,
        size.height * 0.8785143);
    path.cubicTo(
        size.width * 0.5254921,
        size.height * 0.8875000,
        size.width * 0.6340214,
        size.height * 0.8542929,
        size.width * 0.7195286,
        size.height * 0.7857143);
    path.lineTo(size.width * 0.8947643, size.height * 0.9609571);
    path.cubicTo(
        size.width * 0.8991929,
        size.height * 0.9654143,
        size.width * 0.9044571,
        size.height * 0.9689571,
        size.width * 0.9102571,
        size.height * 0.9713786);
    path.cubicTo(
        size.width * 0.9160643,
        size.height * 0.9737929,
        size.width * 0.9222857,
        size.height * 0.9750429,
        size.width * 0.9285714,
        size.height * 0.9750429);
    path.cubicTo(
        size.width * 0.9348571,
        size.height * 0.9750429,
        size.width * 0.9410857,
        size.height * 0.9737929,
        size.width * 0.9468857,
        size.height * 0.9713786);
    path.cubicTo(
        size.width * 0.9526929,
        size.height * 0.9689571,
        size.width * 0.9579571,
        size.height * 0.9654143,
        size.width * 0.9623857,
        size.height * 0.9609571);
    path.cubicTo(
        size.width * 0.9709643,
        size.height * 0.9520786,
        size.width * 0.9757643,
        size.height * 0.9402071,
        size.width * 0.9757643,
        size.height * 0.9278571);
    path.cubicTo(
        size.width * 0.9757643,
        size.height * 0.9155071,
        size.width * 0.9709643,
        size.height * 0.9036429,
        size.width * 0.9623857,
        size.height * 0.8947643);
    path.close();
    path.moveTo(size.width * 0.4523829, size.height * 0.7857143);
    path.cubicTo(
        size.width * 0.3864557,
        size.height * 0.7857143,
        size.width * 0.3220093,
        size.height * 0.7661643,
        size.width * 0.2671929,
        size.height * 0.7295429);
    path.cubicTo(
        size.width * 0.2123764,
        size.height * 0.6929121,
        size.width * 0.1696521,
        size.height * 0.6408529,
        size.width * 0.1444229,
        size.height * 0.5799443);
    path.cubicTo(
        size.width * 0.1191936,
        size.height * 0.5190357,
        size.width * 0.1125929,
        size.height * 0.4520129,
        size.width * 0.1254543,
        size.height * 0.3873529);
    path.cubicTo(
        size.width * 0.1383164,
        size.height * 0.3226921,
        size.width * 0.1700629,
        size.height * 0.2632979,
        size.width * 0.2166807,
        size.height * 0.2166807);
    path.cubicTo(
        size.width * 0.2632979,
        size.height * 0.1700629,
        size.width * 0.3226921,
        size.height * 0.1383164,
        size.width * 0.3873529,
        size.height * 0.1254543);
    path.cubicTo(
        size.width * 0.4520129,
        size.height * 0.1125929,
        size.width * 0.5190357,
        size.height * 0.1191936,
        size.width * 0.5799443,
        size.height * 0.1444229);
    path.cubicTo(
        size.width * 0.6408529,
        size.height * 0.1696521,
        size.width * 0.6929121,
        size.height * 0.2123764,
        size.width * 0.7295429,
        size.height * 0.2671929);
    path.cubicTo(
        size.width * 0.7661643,
        size.height * 0.3220093,
        size.width * 0.7857143,
        size.height * 0.3864557,
        size.width * 0.7857143,
        size.height * 0.4523829);
    path.cubicTo(
        size.width * 0.7857143,
        size.height * 0.5407886,
        size.width * 0.7506000,
        size.height * 0.6255729,
        size.width * 0.6880850,
        size.height * 0.6880850);
    path.cubicTo(
        size.width * 0.6255729,
        size.height * 0.7506000,
        size.width * 0.5407886,
        size.height * 0.7857143,
        size.width * 0.4523829,
        size.height * 0.7857143);
    path.close();

    Paint paint = Paint()..style = PaintingStyle.fill;
    paint.color = Colours.secondaryTextColor;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
