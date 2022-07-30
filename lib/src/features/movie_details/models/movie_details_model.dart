import 'genres_model.dart';

class MovieDetailsModel {
  MovieDetailsModel({
    required this.budget,
    required this.genres,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.productionCompanies,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.voteAverage,
  });
  late final int budget;
  late final List<Genres> genres;
  late final int id;
  late final String originalTitle;
  late final String? overview;
  late final String? posterPath;
  late final List<ProductionCompanies> productionCompanies;
  late final String releaseDate;
  late final int? runtime;
  late final String title;
  late final double voteAverage;
  
  MovieDetailsModel.fromJson(Map<String, dynamic> json){
    budget = json['budget'];
    genres = List.from(json['genres']).map((e)=>Genres.fromJson(e)).toList();
    id = json['id'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    productionCompanies = List.from(json['production_companies']).map((e)=>ProductionCompanies.fromJson(e)).toList();
    releaseDate = json['release_date'];
    runtime = json['runtime'];
    title = json['title'];
    voteAverage = json['vote_average'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['budget'] = budget;
    _data['genres'] = genres.map((e)=>e.toJson()).toList();
    _data['id'] = id;
    _data['original_title'] = originalTitle;
    _data['overview'] = overview;
    _data['poster_path'] = posterPath;
    _data['production_companies'] = productionCompanies.map((e)=>e.toJson()).toList();
    _data['release_date'] = releaseDate;
    _data['runtime'] = runtime;
    _data['title'] = title;
    _data['vote_average'] = voteAverage;
    return _data;
  }
}

class ProductionCompanies {
  ProductionCompanies({
    required this.name,
  });
  late final String name;
  
  ProductionCompanies.fromJson(Map<String, dynamic> json){
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    return _data;
  }
}