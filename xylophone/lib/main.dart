import 'package:flutter/material.dart';
// pub.dev
import 'package:audioplayers/audioplayers.dart';
// 패키지를 설치하고 사용할 경우 import를 통해 패키지를 명시해야지 코드를 쓸 수 있다.
//
// 패키지 설치
// 패키지 설치는 pub.dev에서 패키지 검색을 하고 설치한다.
// install을 누르면 설치방법이 나오며 pubspec.yaml에 직접 추가하거나,
// 터미널에서 flutter pub add ???? 으로 추가할 수 있다.
// pubspec.yaml에서 dependencies를 보면 버전 앞에 ^ 표시가 있다.
// ^표시는 사용 가능한 버전의 범주를 나타내며
// 예를 들어 ^0.20.1 버전이 있으면  0.20.1 <= 범위 < 1.0.0 의 범위를 가지는 것과 같다.

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  // 코드 간략화를 위한 함수 제작
  void Key(int n) {
    final player = AudioCache();
    // package파일을 잘 읽어보도록 한다.
    player.play('note$n.wav');
    // pubspec.yaml에서 asset은 이미지, 텍스트, 오디오 파일에 대한 설정을 할 수 있다.
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              FlatButton(
                color: Colors.red,
                onPressed: () {
                  Key(1);
                },
              ),
              FlatButton(
                color: Colors.orange,
                onPressed: () {
                  Key(2);
                },
              ),
              FlatButton(
                color: Colors.yellow,
                onPressed: () {
                  Key(3);
                },
              ),
              FlatButton(
                color: Colors.green,
                onPressed: () {
                  Key(4);
                },
              ),
              FlatButton(
                color: Colors.blue,
                onPressed: () {
                  Key(5);
                },
              ),
              FlatButton(
                color: Colors.indigo,
                onPressed: () {
                  Key(6);
                },
              ),
              FlatButton(
                color: Colors.purple,
                onPressed: () {
                  Key(7);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
