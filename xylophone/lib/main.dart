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
// => 는 {return}과 동일하다.
// 1 줄만 사용 가능하고 return 값이 없는 void에도 사용가능하다.

class XylophoneApp extends StatelessWidget {
  // 코드 간략화를 위한 함수 제작
  void Key(int n) {
    final player = AudioCache();
    // package파일을 잘 읽어보도록 한다.
    player.play('note$n.wav');
    // pubspec.yaml에서 asset은 이미지, 텍스트, 오디오 파일에 대한 설정을 할 수 있다.
  }

  // 아래와 같이 위젯도 함수를 써서 반복되는 위젯의 코드를 축약할 수 있다.
  // 하지만 함수로 만들기 앞서 해야할 과정이 있다.
  // 1. 문장의 끝이 ;로 끝난다.
  // 2. 함수의 return Type에 void가 있으면 안된다.
  //    임의의 함수를 만든다고하면 return 값이 있는 함수를 만들 수 있고,
  //    return 값이 없는 함수를 만들수 있는데 return값이 없는 함수는 void를 사용해도 되지만
  //    return 값이 있는 경우 return값에 따라 Type을 정해줘야한다.
  //    밑에 있는 함수도 return 값이 있기 때문에 Type을 return값에 맞춰 Type을 정해줘야 한다.
  // 3. property가 있는 위젯을 함수로 만들려면 인자를 입력하는 () 안에 {Type property}로 정의해줘야 한다.
  //    이해를 위해 아래 코드를 해석해보자면
  //    build 메서드 안 XyloTile 함수를 보면 () 안에 property들이 있다.
  //    property에 hover해보면 Type이 나온다.
  //    이 Type을 아래 XyloTile 함수의 인자에 넣는다.
  //    {Type property} 이런식으로 넣으면 된다.
  //    그리고 아래 함수에는 build 메서드 안의 함수에서 작성했던 property를 넣어주면된다.
  //    한마디로 property가 변수 역할을 하게되는 것이다.
  Expanded XyloTile({Color color, int keyNumber}) {
    int n;
    return Expanded(
      flex: 1,
      child: FlatButton(
        color: color,
        onPressed: () {
          Key(keyNumber);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              XyloTile(color: Colors.red, keyNumber: 1),
              XyloTile(color: Colors.orange, keyNumber: 2),
              XyloTile(color: Colors.yellow, keyNumber: 3),
              XyloTile(color: Colors.green, keyNumber: 4),
              XyloTile(color: Colors.blue, keyNumber: 5),
              XyloTile(color: Colors.indigo, keyNumber: 6),
              XyloTile(color: Colors.purple, keyNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
