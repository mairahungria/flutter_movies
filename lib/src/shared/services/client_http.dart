import '../resources/errors.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../resources/urls.dart';
import '../../features/home/models/movies_model.dart';
import '../../features/movie_details/models/genres_model.dart';
import '../../features/movie_details/models/credits_model.dart';
import '../../features/movie_details/models/movie_details_model.dart';

class ClientHttp {
  Future<MovieDetailsModel> getMovieDetails(int id) async {
    final response = await http.get(
      Uri.parse(url.movieDetails(id)),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      throw InvalidKey();
    } else if (response.statusCode == 404) {
      throw NotFound();
    } else {
      throw CriticalError();
    }
  }

  Future<CreditsModel> getMovieCredits(int id) async {
    final response = await http.get(
      Uri.parse(url.movieCredits(id)),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      return CreditsModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      throw InvalidKey();
    } else if (response.statusCode == 404) {
      throw NotFound();
    } else {
      throw CriticalError();
    }
  }

  Future<GenresModel> getGenresId() async {
    final response = await http.get(
      Uri.parse(url.moviesID),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      return GenresModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      throw InvalidKey();
    } else if (response.statusCode == 404) {
      throw NotFound();
    } else {
      throw CriticalError();
    }
  }

  Future<MoviesModel> discoverMovies(int genreID) async {
    final response = await http.get(
      Uri.parse(url.discoverMovies(genreID)),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      return MoviesModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      throw InvalidKey();
    } else if (response.statusCode == 404) {
      throw NotFound();
    } else {
      throw CriticalError();
    }
  }

  Future<MoviesModel> searchMovies(String query) async {
    final response = await http.get(
      Uri.parse(url.searchMovie(query)),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      return MoviesModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      throw InvalidKey();
    } else if (response.statusCode == 404) {
      throw NotFound();
    } else {
      throw CriticalError();
    }
  }
}