import 'package:flutter/material.dart';
import 'package:movies_app/widget/media_list.dart';
import 'package:movies_app/common/MediaProvider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
 }
class _HomeState extends State<Home> {

  final MediaProvider movieProvider = MovieProvider();
  final MediaProvider showProvider = ShowProvider();

  MediaType mediaType = MediaType.movie;

  List<BottomNavigationBarItem> _getFooterItems(){
    return [
      BottomNavigationBarItem(icon: Icon(Icons.thumb_up), title: Text("Populares")),
      BottomNavigationBarItem(icon: Icon(Icons.update), title: Text("Próximamente")),
      BottomNavigationBarItem(icon: Icon(Icons.star), title: Text("Mejor Valoradas"))
    ];
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {}
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(child: Material()),
            ListTile(
              title: Text("Películas"),
              selected: mediaType == MediaType.movie,
              trailing: Icon(Icons.local_movies),
              onTap: (){
                _changeMediaType(MediaType.movie);
                Navigator.of(context).pop();
              },
            ),
            Divider(height: 5.0,),
            ListTile(
              selected: mediaType == MediaType.show,
              title: Text("Televisión"),
              trailing: Icon(Icons.live_tv),
              onTap: (){
                _changeMediaType(MediaType.show);
                Navigator.of(context).pop();
              },
            ),
            Divider(height: 5.0,),
            ListTile(
              title: Text("Cerrar"),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: PageView(
        children: _getMediaList()
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _getFooterItems(),
      ) 
    );
  }

  void _changeMediaType(MediaType type){
      if (mediaType != type) {
        setState(() {
          mediaType = type;
        });
      }
  }

  List<Widget> _getMediaList(){
    return (mediaType == MediaType.movie) ? 
    <Widget>[
      MediaList(movieProvider)
    ]:<Widget>[
      MediaList(showProvider)
    ];
  }
}