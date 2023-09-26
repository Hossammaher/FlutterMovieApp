import 'package:flutter/material.dart';
import 'package:movie_app/screens/DetailsPage.dart';

import '../Model/MovieModel.dart';

class playingCardWidget extends StatelessWidget {
  MovieModel model;
  double cardHeight, cardWidth;

  playingCardWidget(
      {super.key,
      required this.model,
      required this.cardHeight,
      required this.cardWidth});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailsPage.id, arguments: model);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(children: [
          Container(
            height: cardHeight,
            width: cardWidth,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 10,
              child: Image.network(model.backdropPath, fit: BoxFit.fill,

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
          ),
          Positioned(
              bottom: 35,
              left: 10,
              child: Card(
                  color: Colors.transparent,
                  child: Text(
                    model.movieName,
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
                        " " + model.voteAverage.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ))),
        ]),
      ),
    );
  }
}
