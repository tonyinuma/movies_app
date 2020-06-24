import 'package:flutter/material.dart';
import 'package:movies_app/widget/media_list.dart';
import 'package:movies_app/common/MediaProvider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
 }
class _HomeState extends State<Home> {

  @override
  void initState() {
    _pageController = PageController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  final MediaProvider movieProvider = MovieProvider();
  final MediaProvider showProvider = ShowProvider();
  PageController _pageController;
  int _page = 0;

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
        children: _getMediaList(),
        controller: _pageController,
        onPageChanged: (int index){
          setState(() {
            _page = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _getFooterItems(),
        onTap: _navigationTapped,
        currentIndex: _page,
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
      MediaList(movieProvider, "popular"),
      MediaList(movieProvider, "upcoming"),
      MediaList(movieProvider, "top_rated")
    ]:<Widget>[
      MediaList(showProvider, "popular"),
      MediaList(showProvider, "on_the_air"),
      MediaList(showProvider, "top_rated")
    ];
  }

  void _navigationTapped(int page){
    _pageController
      .animateToPage(
        page, 
        duration: const Duration(microseconds: 300), 
        curve: Curves.ease
      );
  }
}