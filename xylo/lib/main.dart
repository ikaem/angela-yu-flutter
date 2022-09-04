import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:xylo/widgets/XyloButton.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _assetsAudioPlayer = AssetsAudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _renderXyloButtons(),
        ),
      ),
    );
  }

  List<Widget> _renderXyloButtons() {
    Map<int, Color> colors = {
      1: Colors.red,
      2: Colors.orange,
      3: Colors.yellow,
      4: Colors.lightGreen,
      5: Colors.green,
      6: Colors.blue,
      7: Colors.purple,
    };

    final buttons = List<Widget>.generate(
      7,
      (index) => XyloButton(
        color: colors[index + 1]!,
        playFile: () {
          _playFile(index + 1);
        },
      ),
    );

    return buttons;
  }

  void _playFile(int file) async {
    // AssetsAudioPlayer().open(
    //   Audio("assets/sounds/assets_note${file.toString()}.wav"),
    // );
    _assetsAudioPlayer
        .open(Audio("assets/sounds/assets_note${file.toString()}.wav"));
  }
}
