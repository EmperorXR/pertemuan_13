import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoplayerappPage extends StatefulWidget{
  VideoplayerappPage({super.key});

  @override
  State<VideoplayerappPage> createState() => _VideoplayerpappPageState();
}

class _VideoplayerpappPageState extends State<VideoplayerappPage>{
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;


  @override
  void initState(){
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      ),
    );

    _initializeVideoPlayerFuture = _controller.initialize();

    _controller.setLooping(true);
  }

  @override
  void dispose(){
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture, 
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,

              child: VideoPlayer(_controller),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            if(_controller.value.isPlaying){
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow
        ),
      ),
    );
  }
}