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

  Widget _builderCasts(BuildContext ctx, int index){
    var cast = _cast[index];
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(
              cast.getCastUrl()
            ),
            radius: 50.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              cast.name
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox.fromSize(
          size: const Size.fromHeight(180.0),
          child: ListView.builder(
            itemCount: _cast.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(top: 12.0,left: 20.0),
            itemBuilder: _builderCasts,
          ),
        )
      ],
    );
  }
}