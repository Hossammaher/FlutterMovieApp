import 'package:movie_app/helper/Api.dart';

import '../Model/TranslationsModel.dart';

class getTranslateMovie{


  Future<List<TranslationsModel>> getMovies ({required String Url}) async {

    List<dynamic> data = await Api().getTranslate(Url: Url ,
        header: {
          'Authorization' : 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNjQyYzkwMDljZGM2ZmE4YzA4MWExZTAxNDVmNWJiNSIsInN1YiI6IjY0MWRhZWYxZTFmYWVkMDA4NmM3Njg0MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Dc-5rh9rFSiQwDPl1UFZm7JBfgf0on04J12QnJQmfLc'
          ,'accept': 'application/json'
        }) ;


    List<TranslationsModel> translateList = [];
    for (int i = 0; i < data.length; i++) {
      translateList.add(TranslationsModel.fromJson(data[i]));
    }

    return translateList;

  }
}