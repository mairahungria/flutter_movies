import 'package:flutter/material.dart';
import 'package:flutter_movies/src/features/movie_details/models/settings_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../shared/resources/strings.dart';
import '../../shared/widgets/movie_cover.dart';
import '../../shared/resources/sizes.dart';
import '../../shared/resources/colors.dart';
import 'controllers/movie_details_controller.dart';
import 'models/credits_model.dart';
import 'widgets/genres_tag.dart';
import 'widgets/info_tag.dart';
import 'widgets/info_text.dart';
import 'widgets/return_button.dart';
import 'widgets/subtitle.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({Key? key, required this.data}) : super(key: key);
  final Settings data;

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  late final MovieDetailsController controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<MovieDetailsController>();
    controller.getMovieDetails(widget.data.id);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 144;
    final watch = context.watch<MovieDetailsController>();
    String productionCompanies = '';
    String actors = '';
    String directors = '';
    if (watch.state == MovieDetailsState.success) {
      for (int company = 0;
          company < watch.movieDetails.productionCompanies.length;
          company++) {
        if (company == watch.movieDetails.productionCompanies.length - 1) {
          productionCompanies +=
              watch.movieDetails.productionCompanies[company].name;
          break;
        }
        productionCompanies +=
            '${watch.movieDetails.productionCompanies[company].name}, ';
      }

      for (Cast actor in watch.credits.cast) {
        if (watch.credits.cast.length > 4) {
          if (actor == watch.credits.cast[4]) {
            actors += actor.name;
            break;
          }
          if (watch.credits.cast.length > 5) {
            if (actor == watch.credits.cast[5]) break;
          }
        }
        actors += '${actor.name}, ';
      }

      final listDirectors = watch.credits.crew
          .where((crew) => crew.job.toLowerCase() == 'director');
      for (Crew director in listDirectors) {
        if (director == listDirectors.last) {
          directors += director.name;
          break;
        }
        directors += '${director.name}, ';
      }
    }

    debugPrint('${widget.data.id}');

    return Stack(
      children: [
        Container(
          color: Colours.backgroundGrey,
          width: double.maxFinite,
          height: double.maxFinite,
        ),
        SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    color: Colours.backgroundGrey,
                    width: double.maxFinite,
                    height: width + 20,
                  ),
                  watch.state == MovieDetailsState.success
                      ? Column(
                          children: [
                            Container(
                              color: Colours.backgroundGrey,
                              width: double.maxFinite,
                              height: width + 20,
                            ),
                            Container(
                              color: Colours.white,
                              width: double.maxFinite,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: width),
                                    Center(
                                      child: Column(
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              style: TextStyle(
                                                fontFamily:
                                                    GoogleFonts.montserrat()
                                                        .fontFamily,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 1,
                                              ),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: watch
                                                      .movieDetails.voteAverage
                                                      .toStringAsFixed(1),
                                                  style: TextStyle(
                                                    color: Colours
                                                        .detailsPrimaryColor,
                                                    fontSize: sizes
                                                        .scoreTextSize(context),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: Strings.score,
                                                  style: TextStyle(
                                                    color: Colours
                                                        .detailsSecondaryColor,
                                                    fontSize:
                                                        sizes.mediumTextSize(
                                                            context),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 32),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Text(
                                              watch.movieDetails.title,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colours.textColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: sizes
                                                    .mediumTextSize(context),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30),
                                            child: RichText(
                                              textAlign: TextAlign.center,
                                              text: TextSpan(
                                                style: TextStyle(
                                                  fontFamily:
                                                      GoogleFonts.montserrat()
                                                          .fontFamily,
                                                  color: Colours
                                                      .secondaryTextColor,
                                                  fontSize:
                                                      sizes.extraSmallTextSize(
                                                          context),
                                                  letterSpacing: 1,
                                                ),
                                                children: <TextSpan>[
                                                  const TextSpan(
                                                    text: Strings.origTitle,
                                                  ),
                                                  TextSpan(
                                                    text: watch.movieDetails
                                                        .originalTitle,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 32),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InfoTag(
                                          title: Strings.year,
                                          data: watch.movieDetails.releaseDate
                                              .split('-')
                                              .first,
                                        ),
                                        const SizedBox(width: 12),
                                        InfoTag(
                                          title: Strings.duration,
                                          data: watch.movieDetails.runtime !=
                                                  null
                                              ? '${watch.movieDetails.runtime! ~/ 60}h ${watch.movieDetails.runtime! % 60} min'
                                              : Strings.unkown,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 22),
                                    Center(
                                      child: Wrap(
                                        spacing: 8,
                                        runSpacing: 8,
                                        children: List.generate(
                                            watch.movieDetails.genres.length,
                                            (index) {
                                          return GenresTags(
                                              genre: watch.movieDetails
                                                  .genres[index].name);
                                        }),
                                      ),
                                    ),
                                    const SizedBox(height: 63),
                                    const Subtitle(
                                        subtitle: Strings.description),
                                    InfoText(
                                        text:
                                            watch.movieDetails.overview == null
                                                ? Strings.unkown
                                                : watch.movieDetails.overview!),
                                    const SizedBox(height: 40),
                                    InfoTag(
                                      title: Strings.budget,
                                      data:
                                          " \$ ${watch.movieDetails.budget.toString().replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',')}",
                                      width: double.maxFinite,
                                    ),
                                    const SizedBox(height: 4),
                                    InfoTag(
                                      title: Strings.productionCompanies,
                                      data: productionCompanies,
                                      width: double.maxFinite,
                                    ),
                                    const SizedBox(height: 40),
                                    const Subtitle(subtitle: Strings.director),
                                    InfoText(text: directors),
                                    const SizedBox(height: 32),
                                    const Subtitle(subtitle: Strings.cast),
                                    InfoText(text: actors),
                                    const SizedBox(height: 90),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(),
                  SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        const SizedBox(height: 112),
                        Hero(
                          tag: 'movieCover${widget.data.id}',
                          child: MovieCover(
                            image: widget.data.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const ReturnButton(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
