class PeopleModel {
  dynamic id;
  dynamic name;
  dynamic profile_path  ;


  PeopleModel(
      {required this.id,
      required this.name,
      required this.profile_path,
      });

  factory PeopleModel.fromJson(jsonData) {
    return PeopleModel(
        id: jsonData['id'],
        name: jsonData['name'],
        profile_path:"https://image.tmdb.org/t/p/w500" + jsonData['profile_path'],
       );
  }
}

class known {
  dynamic movieId;
  dynamic movieBackdropPath;
  dynamic movieTitle;
  dynamic movieOverview;
  dynamic moviePosterPath;

  known(
      {required this.movieId,
      required this.movieBackdropPath,
      required this.movieTitle,
      required this.movieOverview,
      required this.moviePosterPath});

  factory known.fromJson(jsonData) {
    return known(
        movieId: jsonData['id'],
        movieBackdropPath:
            "https://image.tmdb.org/t/p/w500" + jsonData['backdrop_path'],
        movieTitle: jsonData['title'],
        movieOverview: jsonData['overview'],
        moviePosterPath:
            "https://image.tmdb.org/t/p/w500" + jsonData['poster_path']);
  }
}
