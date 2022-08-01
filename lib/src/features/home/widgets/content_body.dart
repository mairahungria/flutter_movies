import 'package:flutter/material.dart';
import 'package:flutter_movies/src/features/movie_details/models/settings_model.dart';
import 'package:provider/provider.dart';
import '../../../shared/resources/strings.dart';
import '../../../shared/resources/urls.dart';
import '../../../shared/widgets/movie_cover.dart';
import '../controllers/home_controller.dart';

class ContentBody extends StatelessWidget {
  const ContentBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late List<Widget> movies;
    final controller = context.watch<HomeController>();
    if (controller.state == HomeState.success) {
      movies = List.generate(controller.movies.results.length, (index) {
        String genres = '';
        List limitGenres = controller.movies.results[index].genreIds.length > 3
            ? controller.movies.results[index].genreIds.getRange(0, 3).toList()
            : controller.movies.results[index].genreIds;
        controller.genresID.genres.where((genre) {
          return limitGenres.contains(genre.id);
        }).forEach((genre) {
          genres += '${genre.name} - ';
        });
        genres = genres.replaceAll(RegExp(r' - $'), '');

        return Hero(
          tag: 'movieCover${controller.movies.results[index].id}',
          child: MovieCover(
            title: controller.movies.results[index].title,
            genres: genres,
            onTap: () => Navigator.pushNamed(
              context,
              Strings.routeMovieDetails,
              arguments: Settings(
                controller.movies.results[index].id,
                url.moviePoster(controller.movies.results[index].posterPath),
              ),
            ),
            image: url.moviePoster(controller.movies.results[index].posterPath),
          ),
        );
      });
    }

    return Scaffold(
      body: controller.state == HomeState.success
          ? ListView(children: movies)
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}