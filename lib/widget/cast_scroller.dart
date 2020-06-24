import 'package:flutter/material.dart';
import 'package:movies_app/common/MediaProvider.dart';
import 'package:movies_app/model/Cast.dart';

class CastScroller extends StatefulWidget {

  final MediaProvider provider;
  final int mediaId;

  CastScroller(this.provider,this.mediaId);

  @override
  _CastScrollerState createState() => new _CastScrollerState();
}

class _CastScrollerState extends State<CastScroller> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCasts();
  }

  final List<Cast> _cast = List<Cast>();
  
  void loadCasts()async{
    var result = await widget.provider.fetchCast(widget.mediaId);
    setState(() {
      _cast.addAll(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      
    );
  }
}