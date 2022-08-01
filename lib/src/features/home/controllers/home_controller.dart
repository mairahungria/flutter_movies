import 'package:flutter/material.dart';
import '../models/movies_model.dart';
import '../../movie_details/models/genres_model.dart';
import '../../../shared/services/client_http.dart';
import '../../../shared/resources/errors.dart';

enum HomeState { idle, loading, success, invalidKey, notFound, error }

enum TabState { idle, loading, success, error }

class HomeController extends ChangeNotifier {
  HomeState state = HomeState.idle;
  TabState tabState = TabState.idle;

  final ClientHttp client;

  HomeController(this.client);

  late GenresModel genresID;
  late MoviesModel movies;

  Future<void> getGenresID() async {
    state = HomeState.loading;
    tabState = TabState.loading;
    notifyListeners();
    try {
      genresID = await client.getGenresId();
      tabState = TabState.success;
      notifyListeners();
    } on InvalidKey {
      state = HomeState.invalidKey;
      notifyListeners();
    } on NotFound {
      state = HomeState.notFound;
      notifyListeners();
    } on CriticalError {
      state = HomeState.error;
      notifyListeners();
    }
  }

  Future<void> loadContent({int? id}) async {
    try {
      if (id == null) {
        await getGenresID();
        movies = await client.discoverMovies(genresID.genres.first.id);
      } else {
        state = HomeState.loading;
        notifyListeners();
        movies = await client.discoverMovies(id);
      }
      state = HomeState.success;
      notifyListeners();
    } on InvalidKey {
      state = HomeState.invalidKey;
      notifyListeners();
    } on NotFound {
      state = HomeState.notFound;
      notifyListeners();
    } on CriticalError {
      state = HomeState.error;
      notifyListeners();
    }
  }

  Future<void> searchContent(String query) async {
    try {
      state = HomeState.loading;
      notifyListeners();
      movies = await client.searchMovies(query);
      state = HomeState.success;
      notifyListeners();
    } on InvalidKey {
      state = HomeState.invalidKey;
      notifyListeners();
    } on NotFound {
      state = HomeState.notFound;
      notifyListeners();
    } on CriticalError {
      state = HomeState.error;
      notifyListeners();
    }
  }
}