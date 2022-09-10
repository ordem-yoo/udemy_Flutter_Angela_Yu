// Package
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Xylophone(),
      ),
    ),
  );
}

class Xylophone extends StatelessWidget {
  void Key(int n) {
    final player = AudioPlayer();
    player.play(AssetSource('note$n.wav'));
  }

  Expanded Xylotile({Color? color, int? keyNumber}) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          Key(keyNumber!);
        },
        child: Container(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Xylotile(color: Colors.red, keyNumber: 1),
          Xylotile(color: Colors.orange, keyNumber: 2),
          Xylotile(color: Colors.yellow, keyNumber: 3),
          Xylotile(color: Colors.green, keyNumber: 4),
          Xylotile(color: Colors.blue, keyNumber: 5),
          Xylotile(color: Colors.indigo, keyNumber: 6),
          Xylotile(color: Colors.purple, keyNumber: 7),
        ],
      ),
    );
  }
}
