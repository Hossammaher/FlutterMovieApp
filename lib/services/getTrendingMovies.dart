import 'package:movie_app/Model/MovieTrailersModel.dart';
import 'package:movie_app/Model/PeopleModel.dart';
import 'package:movie_app/Model/TrendingMoviesModel.dart';

import '../helper/Api.dart';

class getTrendingMovies {
  Future<List<TrendingMovies>> getMovies ()async {
    Map<String,dynamic> data = await Api().getTranslate(
        Url: 'https://api.themoviedb.org/3/trending/movie/week?language=en-US',
        header: {
          'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNjQyYzkwMDljZGM2ZmE4YzA4MWExZTAxNDVmNWJiNSIsInN1YiI6IjY0MWRhZWYxZTFmYWVkMDA4NmM3Njg0MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Dc-5rh9rFSiQwDPl1UFZm7JBfgf0on04J12QnJQmfLc',
          'accept': 'application/json'
        });

    List<TrendingMovies> Movies = [];
    for (int i = 0; i < data.length; i++) {
      Movies.add(TrendingMovies.fromJson(data[i]));
    }


    return Movies;
  }
}
