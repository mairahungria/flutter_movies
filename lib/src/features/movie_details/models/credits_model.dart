class CreditsModel {
  CreditsModel({
    required this.id,
    required this.cast,
    required this.crew,
  });
  late final int id;
  late final List<Cast> cast;
  late final List<Crew> crew;
  
  CreditsModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    cast = List.from(json['cast']).map((e)=>Cast.fromJson(e)).toList();
    crew = List.from(json['crew']).map((e)=>Crew.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['cast'] = cast.map((e)=>e.toJson()).toList();
    _data['crew'] = crew.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Cast {
  Cast({
    required this.knownForDepartment,
    required this.name,
  });
  late final String knownForDepartment;
  late final String name;
  
  Cast.fromJson(Map<String, dynamic> json){
    knownForDepartment = json['known_for_department'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['known_for_department'] = knownForDepartment;
    _data['name'] = name;
    return _data;
  }
}

class Crew {
  Crew({
    required this.name,
    required this.job,
  });
  late final String name;
  late final String job;
  
  Crew.fromJson(Map<String, dynamic> json){
    name = json['name'];
    job = json['job'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['job'] = job;
    return _data;
  }
}