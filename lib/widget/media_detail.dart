import 'package:flutter/material.dart';
import 'package:movies_app/model/Media.dart';
import 'dart:ui' as ui;

class MediaDetail extends StatelessWidget {

  final Media media;

  MediaDetail(this.media);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(
            media.getBackDropUrl(),
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Container(
                      width: 390.0,
                      height: 390.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage(
                          media.getPosterUrl()
                        )
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 20.0,
                          offset: Offset(0.0, 10.0)
                        )
                      ]
                    ),
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(20.0),
            )
          )
        ],
      ),
    );
  }  
}