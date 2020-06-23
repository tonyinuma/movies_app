import 'package:movies_app/common/util.dart';

class Media{
  
  int id;
  double voteAverage;
  String title;
  String posterPath;
  String backdropPath;
  String overview;
  String releaseDate;
  List<dynamic> genreIds;

  String getPosterUrl() => getMediumPictureUrl(posterPath);
  String getBackDropUrl() => getLargePictureUrl(backdropPath);
  String getGenres() => getGenreValues(genreIds);
  int getreleaseYear(){
    if(releaseDate == null || releaseDate == ""){
      return 0;
    }
    return DateTime.parse(releaseDate).year;
  }
  
  factory Media(Map jsonMap){
    try {
      return Media.deserialize(jsonMap);
    } catch (e) {
        throw e;
    }
  }

  Media.deserialize(Map json) :
    id = json["id"].toInt(),
    voteAverage = json["vote_average"].toDouble(),
    title = json["title"],
    posterPath = json["poster_path"] ?? "",
    backdropPath = json["backdrop_path"] ?? "",
    overview = json["overview"],
    releaseDate = json["release_date"],
    genreIds = json["genre_ids"].toList();

}