import 'package:flutter/material.dart';

class TranslateCard extends StatelessWidget {
  String overview ;
   TranslateCard ({required this.overview});

  @override
  Widget build(BuildContext context) {
    print("Card widget called ");

    return Container(
        height: 100,
        width: double.infinity,
        child: Text(overview.toString(),style: TextStyle(color: Colors.black),));
  }
}
