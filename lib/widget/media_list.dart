import 'package:flutter/material.dart';
import 'package:movies_app/common/HttpHandler.dart';
import 'package:movies_app/model/Media.dart';
import 'package:movies_app/widget/media_list_item.dart';
import 'package:movies_app/common/MediaProvider.dart';

class MediaList extends StatefulWidget {

  final MediaProvider provider;

  MediaList(this.provider);

  @override
  _MediaListState createState() => new _MediaListState();
 }
class _MediaListState extends State<MediaList> {

  List<Media> _media = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadMovies();
  }

  @override
  void didUpdateWidget(MediaList oldWidget) {
    if (oldWidget.provider.runtimeType != widget.provider.runtimeType) {
      _media = List();
      loadMovies();
    }
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  void loadMovies() async{
    var movies = await widget.provider.fetchMedia();
    setState(() {
      _media.addAll(movies);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: ListView.builder(
        itemCount: _media.length,
        itemBuilder: (BuildContext context, int index){
          return MediaListItem(_media[index]);
        },
      ),
    );
  }
}

