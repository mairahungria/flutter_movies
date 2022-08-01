import 'package:flutter/material.dart';
import '../resources/sizes.dart';

class MovieCover extends StatelessWidget {
  const MovieCover({
    Key? key,
    this.title = '',
    this.genres = '',
    this.onTap,
    this.image,
  }) : super(key: key);

  final String title;
  final String genres;
  final Function()? onTap;
  final String? image;

  @override
  Widget build(BuildContext context) {
    final bool isHomePage = title != '';
    final width = isHomePage
        ? MediaQuery.of(context).size.width - 40
        : MediaQuery.of(context).size.width - 144;
    final height = width * 1.46875;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: GestureDetector(
        onTap: !isHomePage ? null : onTap,
        child: Stack(
          children: [
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: const Color(0xFF5a757e),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(image ?? ''), fit: BoxFit.cover),
              ),
            ),
            if (isHomePage)
              Positioned(
                bottom: 0,
                child: Container(
                  width: width,
                  height: height * 0.35638,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [Colors.black, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
            if (isHomePage)
              Positioned(
                bottom: 32,
                left: 24,
                child: SizedBox(
                  width: width - 24,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: sizes.mediumTextSize(context),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        genres,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: sizes.smallTextSize(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
