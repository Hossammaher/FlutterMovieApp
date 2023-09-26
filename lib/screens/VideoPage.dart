import 'package:flutter/material.dart';
import 'package:movie_app/Model/MovieTrailersModel.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Model/MovieModel.dart';

class VideoCard extends StatefulWidget {
  static String id = 'VideoCard';
  VideoCard();
  @override
  State<VideoCard> createState() => _VideoCardState();
}

late YoutubePlayerController _controller;

class _VideoCardState extends State<VideoCard> {
  @override
  Widget build(BuildContext context) {
    Object? trailersModel = ModalRoute.of(context)!.settings.arguments;

    _controller =
        YoutubePlayerController(initialVideoId: trailersModel.toString());

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          color: Colors.black,
          child: YoutubePlayerBuilder(
            player: YoutubePlayer(controller: _controller),
            builder: (p0, p1) {
              return YoutubePlayer(controller: _controller);
            },
          ),
        ),
      ),
    );
  }
}
