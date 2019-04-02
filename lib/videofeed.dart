import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class NewsFeed extends StatefulWidget {

  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {

    VideoPlayerController _controller;
    bool _isPlaying = false;

  @override
  void initState() { 
    super.initState();
    _controller =VideoPlayerController.network('http://html5videoplayer.net/videos/toystory.mp4')
    ..addListener((){
        final bool isPlaying = _controller.value.isPlaying;
        if (isPlaying !=_isPlaying) {
          setState(() {
            _isPlaying = isPlaying;
          });
        }
    })
    ..initialize().then((_){
      setState(() {
        
      });
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: Scaffold(
          appBar: new AppBar(
        title: new Text('Video of the Day'),
      ),
         backgroundColor: Colors.blue,
         body: Center(
           child: 
             _controller.value.initialized?AspectRatio(
             aspectRatio: _controller.value.aspectRatio,
             child: VideoPlayer(_controller),
             ):Container(),
             ),
             floatingActionButton: FloatingActionButton(
               foregroundColor: Colors.blue,
               backgroundColor: Colors.white,
               onPressed: _controller.value.isPlaying? _controller.pause :_controller.play,
               child: Icon(
                 _controller.value.isPlaying ? Icons.pause :Icons.play_arrow
               ),
         ),
       ),
    );
  }
}