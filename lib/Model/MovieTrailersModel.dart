class MovieTrailersModel {

  String movieVideoName ;
  String movieVideoKey;
  String movieVideoType ;

  MovieTrailersModel(
      {required this.movieVideoName,required this.movieVideoKey,required this.movieVideoType});

  factory MovieTrailersModel.fromJson(jsonData){
    return MovieTrailersModel(movieVideoName: jsonData['name'],
        movieVideoKey: jsonData['key'],
        movieVideoType: jsonData['type']);
  }

}