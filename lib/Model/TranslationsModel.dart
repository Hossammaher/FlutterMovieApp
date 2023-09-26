import 'dart:convert';

class TranslationsModel {
  Data data;

  TranslationsModel({required this.data});

  factory TranslationsModel.fromJson(jsonData) {
    return TranslationsModel(data: Data.fromJson(jsonData['data']));
  }
}

class Data {
  String overview;

  Data({required this.overview});

  factory Data.fromJson(jsonData) {
    return Data(overview: jsonData['overview']);
  }
}
