import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movies_app/common/Constantes.dart';
import 'package:movies_app/model/Media.dart';

class HttpHandler{
  
  static final _httpHandler = HttpHandler();
  final String _baseUrl = "api.themoviedb.org";
  final String _lang = "es-ES";

  static HttpHandler get(){
    return _httpHandler;
  }
  
  Future<dynamic> getJson(Uri uri)async{
    http.Response response = await http.get(uri);
    return json.decode(response.body);
  }

  Future<List<Media>> fetchMovies(){
    var uri = Uri.http(_baseUrl, "/3/movie/popular",{
      'api_key': API_KEY,
      'language': _lang,
      'page' : "1"
    });

    return getJson(uri).then((data) => 
      data['results'].map<Media>((item) => Media(item)).toList()
    );
  }

}

