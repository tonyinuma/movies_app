import 'dart:async';
import 'package:movies_app/common/HttpHandler.dart';
import 'package:movies_app/model/Cast.dart';
import 'package:movies_app/model/Media.dart';

abstract class MediaProvider {
  
  Future<List<Media>> fetchMedia(String category);
  Future<List<Cast>> fetchCast(int mediaId);

}

class MovieProvider extends MediaProvider{

  HttpHandler _client = HttpHandler.get();

  @override
  Future<List<Media>> fetchMedia(String category){
    return _client.fetchMovies(category: category);
  }

  @override
  Future<List<Cast>> fetchCast(int mediaId) {
    return _client.fetchCreditMovies(mediaId);
  }
}

class ShowProvider extends MediaProvider{
  HttpHandler _client = HttpHandler.get();

  @override
  Future<List<Media>> fetchMedia(String category){
    return _client.fetchShow(category: category);
  }

  @override
  Future<List<Cast>> fetchCast(int mediaId) {
    return _client.fetchCreditShows(mediaId);
  }
}


enum MediaType{movie, show}