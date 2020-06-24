import 'package:movies_app/common/MediaProvider.dart';
import 'package:movies_app/common/util.dart';

class Cast{

  int id;
  String name;
  String profilePath;

  String getCastUrl() => getMediumPictureUrl(profilePath);

  factory Cast(Map jsonMap, MediaType mediaType){
    try {
      return Cast.deserialize(jsonMap, mediaType);
    } catch (e) {
        throw e;
    }
  }

  Cast.deserialize(Map jsonMap, MediaType mediaType) :
    id = (mediaType == MediaType.movie ? jsonMap["cast_id"] : jsonMap["id"]).toInt(),
    name = jsonMap["name"],
    profilePath = jsonMap["profile_path"] ?? "/eze9FO9VuryXLP0aF2cRqPCcibN.jpg";

}