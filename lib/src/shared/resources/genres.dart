enum Genre { action, adventure, animation, comedy, crime, documentary, drama, family, fantasy, history, horror, music, mystery, romance, scienceFiction, tvMovie, thriller, war, western }

extension GenreExt on Genre {
  String get ptBR {
    switch (this) {
      case Genre.action:
        return 'Ação';
      case Genre.adventure:
        return 'Aventura';
      case Genre.animation:
        return 'Animação';
      case Genre.comedy:
        return 'Comédia';
      case Genre.crime:
        return 'Crime';
      case Genre.documentary:
        return 'Documentário';
      case Genre.drama:
        return 'Drama';
      case Genre.family:
        return 'Família';
      case Genre.fantasy:
        return 'Fantasia';
      case Genre.history:
        return 'História';
      case Genre.horror:
        return 'Terror';
      case Genre.music:
        return 'Música';
      case Genre.mystery:
        return 'Mistério';
      case Genre.romance:
        return 'Romance';
      case Genre.scienceFiction:
        return 'Ficção científica';
      case Genre.tvMovie:
        return 'Cinema TV';
      case Genre.thriller:
        return 'Thriller';
      case Genre.war:
        return 'Guerra';
      case Genre.western:
        return 'Faroeste';
    }
  }
}