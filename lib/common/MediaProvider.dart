import 'dart:async';
import 'package:movies_app/common/HttpHandler.dart';
import 'package:movies_app/model/Media.dart';

abstract class MediaProvider {
  
  Future<List<Media>> fetchMedia(String category);

}

class MovieProvider extends MediaProvider{

  HttpHandler _client = HttpHandler.get();

  @override
  Future<List<Media>> fetchMedia(String category){
    return _client.fetchMovies(category: category);
  }
}

class ShowProvider extends MediaProvider{
  HttpHandler _client = HttpHandler.get();

  @override
  Future<List<Media>> fetchMedia(String category){
    return _client.fetchShow(category: category);
  }
}


enum MediaType{movie, show}