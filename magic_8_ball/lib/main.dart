import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Ball(),
      ),
    );

class Ball extends StatefulWidget {
  // 앱 UI의 유동적 변화를 위해서 StatefulWidget 사용
  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;

  // onpressed안 함수의 내용
  void ChangeBallNumber() {
    setState(() {
      ballNumber = Random().nextInt(5) + 1;
    });
    print('I got clicked');
    print('ballNumber = $ballNumber');
  }

  @override
  Widget build(BuildContext context) {
    // build 메서드를 피한 변수 선언
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade200,
      appBar: AppBar(
        title: Text('Ask Me Anything'),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () {
            // 함수 사용
            ChangeBallNumber();
          },
          child: Image.asset('images/ball$ballNumber.png'),
          // String interpolation 사용
        ),
      ),
    );
  }
}
