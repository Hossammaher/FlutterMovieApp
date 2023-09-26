import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movie_app/Model/PeopleModel.dart';

import '../Model/MovieModel.dart';
import '../Model/TrendingMoviesModel.dart';
import '../Widgets/playingCardWidget.dart';
import '../services/getPlayingMovies.dart';
import '../services/getTrendingMovies.dart';
import '../services/getTrendingPeople.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static String id = "HomePage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies DB ", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Color(0xffEDECED),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text("Now Playing ",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
              Container(
                height: 300,
                child: FutureBuilder<List<MovieModel>>(
                  future: getPlayingMovies().getMovies(
                      Url:
                          'https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1'),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<MovieModel> movieModel = snapshot.data!;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return playingCardWidget(
                            model: movieModel[index],
                            cardHeight: 300,
                            cardWidth: 300,
                          );
                        },
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text("Top Rated ",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
              Container(
                height: 300,
                child: FutureBuilder<List<MovieModel>>(
                  future: getPlayingMovies().getMovies(
                      Url:
                          'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1'),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<MovieModel> movieModel = snapshot.data!;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return playingCardWidget(
                            model: movieModel[index],
                            cardHeight: 300,
                            cardWidth: 150,
                          );
                        },
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text("Upcoming",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
              Container(
                height: 300,
                child: FutureBuilder<List<MovieModel>>(
                  future: getPlayingMovies().getMovies(
                      Url:
                          'https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1'),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<MovieModel> movieModel = snapshot.data!;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return playingCardWidget(
                            model: movieModel[index],
                            cardHeight: 300,
                            cardWidth: 150,
                          );
                        },
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8),
                child: Text("Trending People",
                    style:
                    TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
              Container(
                height: 300,
                child: FutureBuilder<List<PeopleModel>>(
                  future: getTrendingPeople().getPeople(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<PeopleModel> peopleModel = snapshot.data!;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: peopleModel.length,
                        itemBuilder: (context, index) {
                        var imageUrl = peopleModel[index].profile_path ;
                          return
                          Container(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: [
                                CircleAvatar(
                                radius: 100,
                                backgroundImage:
                                imageUrl != null && imageUrl.isNotEmpty
                                    ? NetworkImage(imageUrl) as ImageProvider<Object>?
                                    : AssetImage('assets/fallback_image.png')as ImageProvider<Object>?,



                                // image_url =null ? NetworkImage(image_url) : Image.asset('assets/placeholder.jpg'),
                                ),
                                SizedBox(height: 5,),
                                Text(peopleModel[index].name, style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                                
                              ],
                            ),
                          );

                        },
                      );
                    } else {
                      throw Exception(snapshot.error);

                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
