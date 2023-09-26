import 'package:movie_app/Model/MovieModel.dart';
import 'package:movie_app/helper/Api.dart';

class getPlayingMovies {
  Future<List<MovieModel>> getMovies({required String Url}) async {
    List<dynamic> data = await Api().get(Url: Url, header: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNjQyYzkwMDljZGM2ZmE4YzA4MWExZTAxNDVmNWJiNSIsInN1YiI6IjY0MWRhZWYxZTFmYWVkMDA4NmM3Njg0MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Dc-5rh9rFSiQwDPl1UFZm7JBfgf0on04J12QnJQmfLc',
      'accept': 'application/json'
    });

    List<MovieModel> moiveList = [];
    for (int i = 0; i < data.length; i++) {
      moiveList.add(MovieModel.fromJson(data[i]));
    }

    return moiveList;
  }
}
