class MovieModel {
  int id;
  String movieName;
  String overview;
  dynamic posterImage;
  dynamic voteAverage;
  dynamic backdropPath ;
  dynamic releaseDate;

  MovieModel(
      {
      required this.id,
      required this.movieName,
      required this.overview,
      required this.posterImage,
      required this.voteAverage,
      required this.backdropPath,
      required this.releaseDate,
  });

  factory MovieModel.fromJson(jsonData){

    return MovieModel(
        id:jsonData['id'] ,
        movieName: jsonData['original_title'],
        overview: jsonData['overview'],
        posterImage:"https://image.tmdb.org/t/p/w500" + jsonData['poster_path'],
        voteAverage: jsonData['vote_average'],
        backdropPath:"https://image.tmdb.org/t/p/w500" + jsonData['backdrop_path'],
        releaseDate: jsonData['release_date']
        );

  }
}
