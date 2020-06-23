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
          Container(
            child: Stack(
              children: <Widget>[
                FadeInImage.assetNetwork(
                  placeholder: "assets/placeholder.jpg", 
                  image: media.getBackDropUrl(),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                  fadeInDuration: Duration(milliseconds: 40),
                ),
                Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[900].withOpacity(0.5)
                    ),
                    constraints: BoxConstraints.expand(
                      height: 55.0
                    ),
                  )
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
