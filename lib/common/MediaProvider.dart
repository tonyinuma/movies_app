import 'dart:async';
import 'package:movies_app/common/HttpHandler.dart';
import 'package:movies_app/model/Media.dart';
import 'package:movies_app/common/MediaProvider.dart';

abstract class MediaProvider {
  
  Future<List<Media>> fetchMedia();

}

class MovieProvider extends MediaProvider{

  HttpHandler _client = HttpHandler.get();

  @override
  Future<List<Media>> fetchMedia(){
    return _client.fetchMovies();
  }
}

class ShowProvider extends MediaProvider{

}


