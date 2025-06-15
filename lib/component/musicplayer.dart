import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';

class MusicplayerappPage extends StatefulWidget{
  @override
  _MusicplayerappPageState createState() => _MusicplayerappPageState();
}

class _MusicplayerappPageState extends State<MusicplayerappPage>{

final audioplayer = AudioPlayer();
bool isPlaying = false;
Duration duration = Duration.zero;
Duration position = Duration.zero;

String formatTime(Duration duration){
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));

  return [
    if (duration.inHours > 0 ) hours,
    minutes,
    seconds,
  ].join(':');
}

@override
void initState(){
  super.initState();

  setAudio();

  audioplayer.onPlayerStateChanged.listen((state){
    setState((){
      isPlaying = state == PlayerState.playing;
    });
  });

  audioplayer.onDurationChanged.listen((newDuration){
    setState(() {
      duration = newDuration;
    });
  });

  audioplayer.onPositionChanged.listen((newPosition){
    setState(() {
      position = newPosition;
    });
  });
}

Future setAudio() async {
  //Repeat song when complete
  audioplayer.setReleaseMode(ReleaseMode.loop);


  //Load audio from Images
  final player = AudioCache(prefix: 'images/');
  final url = await player.load('1.mp3');
  audioplayer.setSourceUrl(url.path);
}

@override
void dispose(){
  audioplayer.dispose();

  super.dispose();
}

@override
Widget build(BuildContext context) => Scaffold(
  body: SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "images/cover.jpg",
              width: double.infinity,
              height: 500,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 30),
          Text(
            "V.A",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            "BRAVE THE OCEAN",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Slider(
            min: 0,
            max: duration.inSeconds.toDouble(),
            value: position.inSeconds.toDouble(), 
            onChanged: (value) async {
              final position = Duration(seconds: value.toInt());
              await audioplayer.seek(position);
    
              await audioplayer.resume();
            }
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formatTime(position)),
                Text(formatTime(duration - position)),
              ],
            ),
          ),
          CircleAvatar(
            radius: 35,
            child: IconButton(
              onPressed: () async {
                if (isPlaying){
                  await audioplayer.pause();
                } else {             
                  await audioplayer.resume();
                }
              }, 
              icon: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
              ),
              iconSize: 50,
            ),
          )
        ],
      ),),
  ),
);
}