import 'package:movie_app/Model/MovieTrailersModel.dart';

import '../helper/Api.dart';

class getMovieTrailers {
  Future<List<MovieTrailersModel>> getTrailers({required String Url}) async {
    List<dynamic> data = await Api().get(Url: Url, header: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNjQyYzkwMDljZGM2ZmE4YzA4MWExZTAxNDVmNWJiNSIsInN1YiI6IjY0MWRhZWYxZTFmYWVkMDA4NmM3Njg0MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Dc-5rh9rFSiQwDPl1UFZm7JBfgf0on04J12QnJQmfLc',
      'accept': 'application/json'
    });

    List<MovieTrailersModel> trailerList = [];
    for (int i = 0; i < data.length; i++) {
      trailerList.add(MovieTrailersModel.fromJson(data[i]));
    }


    return trailerList;
  }
}
