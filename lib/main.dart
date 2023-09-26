import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movie_app/Model/MovieModel.dart';
import 'package:movie_app/screens/DetailsPage.dart';
import 'package:movie_app/screens/HomePage.dart';
import 'package:movie_app/screens/VideoPage.dart';



void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => HomePage(),
        DetailsPage.id: (context) => DetailsPage(),
        VideoCard.id:(context) => VideoCard()
      },
      initialRoute: HomePage.id,

    );
  }
}


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host,
          int port) => true;
  }
}