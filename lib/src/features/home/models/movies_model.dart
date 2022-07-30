class MoviesModel {
  MoviesModel({
    required this.page,
    required this.results,
    required this.totalResults,
    required this.totalPages,
  });
  late final int page;
  late final List<Results> results;
  late final int totalResults;
  late final int totalPages;
  
  MoviesModel.fromJson(Map<String, dynamic> json){
    page = json['page'];
    results = List.from(json['results']).map((e)=>Results.fromJson(e)).toList();
    totalResults = json['total_results'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['page'] = page;
    _data['results'] = results.map((e)=>e.toJson()).toList();
    _data['total_results'] = totalResults;
    _data['total_pages'] = totalPages;
    return _data;
  }
}

class Results {
  Results({
    required this.posterPath,
    required this.genreIds,
    required this.id,
    required this.title,
  });
  late final String posterPath;
  late final List<int> genreIds;
  late final int id;
  late final String title;
  
  Results.fromJson(Map<String, dynamic> json){
    posterPath = json['poster_path'];
    genreIds = List.castFrom<dynamic, int>(json['genre_ids']);
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['poster_path'] = posterPath;
    _data['genre_ids'] = genreIds;
    _data['id'] = id;
    _data['title'] = title;
    return _data;
  }
}