import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.blueAccent.shade200,
          appBar: AppBar(
            title: Text('Ask Me Anything'),
          ),
          body: BallPage(),
        ),
      ),
    );

class BallPage extends StatefulWidget {
  // 화ㅁㄴ의 유동적 변화를 위한 StatefulWidget 사용
  @override
  State<BallPage> createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  int changeBall = 1;
  // build 메서드를 피한 변수 선언

  void Changeball() {
    setState(() {
      changeBall = Random().nextInt(5) + 1;
    });
  }
  // onpressed 안 함수의 내용

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        onPressed: () {
          Changeball();
          // 함수 제작
        },
        child: Image.asset('images/ball$changeBall.png'),
        // String interpolation 사용
      ),
    );
  }
}
