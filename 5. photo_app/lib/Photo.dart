import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Photo {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory Photo.fromJSON(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String
    );
  }

  static Future<List<Photo>> getPhotos() async {
    final jsonData = await http.Client().get('https://jsonplaceholder.typicode.com/photos');
    return compute(_mapPhotos, jsonData.body);
  }

  static List<Photo> _mapPhotos(String jsonData) {
    final decodedResult = json.decode(jsonData);

    List<Photo> photos = [];

    for (var photoJSON in decodedResult) {
      Photo photo = Photo.fromJSON(photoJSON);
      photos.add(photo);
    }

    return photos;
  }

}