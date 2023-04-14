import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache(prefix: "audios/");

  _executar() async {
    audioPlayer = await audioCache.play("musica.mp3");

    // String url =
    //     "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-11.mp3";
    // int resultado = await audioPlayer.play(url);

    // if (resultado == 1) {
    //   print("Executou o som!");
    // }
  }

  @override
  Widget build(BuildContext context) {
    _executar();
    return Container(
      child: Center(),
    );
  }
}
