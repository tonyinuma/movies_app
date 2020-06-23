import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movies_app/common/Constantes.dart';

class HttpHandler{

  final String _baseUrl = "api.themoviedb.org";
  final String _lang = "es-ES";
  
  Future<dynamic> getJson(Uri uri)async{
    http.Response response = await http.get(uri);
    return json.decode(response.body).toString();
  }

  Future<String> fetchMovies(){
    var uri = Uri.http(_baseUrl, "/3/movie/popular",{
      'api_key': API_KEY,
      'language': _lang,
      'page' : "1"
    });

    return getJson(uri).then((data) => 
      data.toString()
    );
  }

}

