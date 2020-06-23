import 'package:flutter/material.dart';
import 'package:movies_app/model/Media.dart';

class MediaListItem extends StatelessWidget {

  final Media media;

  MediaListItem(this.media);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          FadeInImage.assetNetwork(
            placeholder: "assets/placeholder.jpg", 
            image: media.getBackDropUrl(),
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200,
            fadeInDuration: Duration(milliseconds: 40),
          )
        ],
      ),
    );
  }
}
