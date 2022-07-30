class URLs {
  final String _api = 'https://api.themoviedb.org/3';
  final String _key = '?api_key=ba978cbc550dbd8fa5fca64c0fbbf1aa';
  final String _lang = '&language=pt-BR';
  final String _adult = '&include_adult=false';
  final String _pag = '&page=1';

  String movieDetails(int id) {
    return '$_api/movie/$id$_key$_lang';
  }

  String movieCredits(int id) {
    return '$_api/movie/$id/credits$_key';
  }

  String get moviesID => '$_api/genre/movie/list$_key$_lang';

  String discoverMovies(int genreID) {
    return '$_api/discover/movie$_key$_lang&sort_by=popularity.desc$_adult$_pag&with_genres=$genreID';
  }

  String searchMovie(String query) {
    return '$_api/search/movie$_key$_lang&query=$query$_adult';
  }
}