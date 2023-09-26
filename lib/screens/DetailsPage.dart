import 'package:flutter/material.dart';
import 'package:movie_app/Model/MovieModel.dart';
import 'package:movie_app/Model/MovieTrailersModel.dart';
import 'package:movie_app/Model/TranslationsModel.dart';
import 'package:movie_app/Widgets/TranslateCard.dart';
import 'package:movie_app/screens/VideoPage.dart';
import 'package:movie_app/services/getMovieTrailers.dart';
import 'package:movie_app/services/getTranslateMovie.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key}) : super(key: key);

  static String id = "DetailsPage";

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<Widget> _widgetList = [];
  bool translateButtonClick = false;

  Widget TranslateContainer(String overview) {
    return Container(
        width: double.infinity,
        child: Text(
          overview.toString(),
          style: TextStyle(color: Colors.black),
        ));
  }

  @override
  Widget build(BuildContext context) {
    MovieModel movieModel =
        ModalRoute.of(context)!.settings.arguments as MovieModel;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  child: Image.network(movieModel.backdropPath,
                      fit: BoxFit.fill,
                      // make CircularProgressIndicator until image downloaded from server
                      frameBuilder:
                          (context, child, frame, wasSynchronouslyLoaded) {
                    return child;
                  }, loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
                ),
                Positioned(
                    bottom: 35,
                    left: 10,
                    child: Card(
                        color: Colors.transparent,
                        child: Text(
                          movieModel.movieName,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ))),
                Positioned(
                    bottom: 10,
                    left: 10,
                    child: Card(
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text(
                              " " + movieModel.voteAverage.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 16),
              child: Text("Trailers",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            Container(
              height: 300,
              child: FutureBuilder<List<MovieTrailersModel>>(
                future: getMovieTrailers().getTrailers(
                    Url:
                        'https://api.themoviedb.org/3/movie/${movieModel.id}/videos'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<MovieTrailersModel> trailerModel = snapshot.data!;
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: trailerModel.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Image.network(
                                      YoutubePlayer.getThumbnail(
                                          videoId: trailerModel[index]
                                              .movieVideoKey)),
                                ),
                              ),
                              Positioned.fill(
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, VideoCard.id,
                                        arguments:
                                            trailerModel[index].movieVideoKey);
                                  },
                                  icon: Icon(Icons.play_arrow),
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          );
                        });
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text("Release Date ",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  Icon(
                    Icons.date_range_rounded,
                    size: 32,
                  ),
                  Text("  " + movieModel.releaseDate,
                      style: TextStyle(fontSize: 16))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text("OverView ",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 1),
              child: Text(movieModel.overview,
                  style: TextStyle(
                    fontSize: 16,
                  )),
            ),

            GestureDetector(
              onTap: translateButtonClick
                  ? null
                  : () async {
                      _handleButtonTap();

                      List<TranslationsModel> model = await getTranslateMovie()
                          .getMovies(
                              Url:
                                  'https://api.themoviedb.org/3/movie/${movieModel.id}/translations');
                      setState(() {
                        _widgetList.add(TranslateContainer(
                            model[0].data.overview.toString()));
                      });
                    },
              child: Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 8),
                child: Text(
                  "Translate",
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
            ),
            //
            Container(
                padding: EdgeInsets.all(16),
                child: Column(children: _widgetList)),
          ],
        ),
      ),
    );
  }

  void _handleButtonTap() {
    setState(() {
      translateButtonClick = true;
    });
    // Perform the action that the button triggers here
  }
}
