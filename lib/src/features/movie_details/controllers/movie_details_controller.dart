import 'package:flutter/material.dart';
import '../../../shared/services/client_http.dart';
import '../../../shared/resources/errors.dart';
import '../models/credits_model.dart';
import '../models/movie_details_model.dart';

enum MovieDetailsState { idle, loading, success, invalidKey, notFound, error }

class MovieDetailsController extends ChangeNotifier {
  MovieDetailsState state = MovieDetailsState.idle;

  final ClientHttp client;

  MovieDetailsController(this.client);

  late MovieDetailsModel movieDetails;
  late CreditsModel credits;

  Future<void> getMovieDetails(int id) async {
    try {
      state = MovieDetailsState.loading;
      notifyListeners();
      movieDetails = await client.getMovieDetails(id);
      credits = await client.getMovieCredits(id);
      state = MovieDetailsState.success;
      notifyListeners();
    } on InvalidKey {
      state = MovieDetailsState.invalidKey;
      notifyListeners();
    } on NotFound {
      state = MovieDetailsState.notFound;
      notifyListeners();
    } on CriticalError {
      state = MovieDetailsState.error;
      notifyListeners();
    }
  }
}
