import 'package:movies_app/common/MediaProvider.dart';
import 'package:movies_app/common/util.dart';

class Cast{

  int id;
  String name;
  String profilePath;

  factory Cast(Map jsonMap, MediaType mediaType){
    try {
      return Cast.deserialize(jsonMap, mediaType);
    } catch (e) {
        throw e;
    }
  }

  Cast.deserialize(Map jsonMap, MediaType mediaType) :
    id = jsonMap["cast_id"].toInt(),
    name = jsonMap["name"],
    profilePath = jsonMap["profile_Path"];

}