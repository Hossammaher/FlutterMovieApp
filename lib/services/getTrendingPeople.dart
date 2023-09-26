import 'package:movie_app/Model/PeopleModel.dart';

import '../helper/Api.dart';

class getTrendingPeople {
  Future<List<PeopleModel>> getPeople() async {
    List<dynamic> data = await Api().get(
        Url: 'https://api.themoviedb.org/3/trending/person/week?language=en-US',
        header: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNjQyYzkwMDljZGM2ZmE4YzA4MWExZTAxNDVmNWJiNSIsInN1YiI6IjY0MWRhZWYxZTFmYWVkMDA4NmM3Njg0MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Dc-5rh9rFSiQwDPl1UFZm7JBfgf0on04J12QnJQmfLc',
          'accept': 'application/json'
        });



    List<PeopleModel> peopleList = [];
    for (int i = 0; i < data.length; i++) {
      peopleList.add(PeopleModel.fromJson(data[i]));
    }

    print(peopleList);
    return peopleList;
  }
}
