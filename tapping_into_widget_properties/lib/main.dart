import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              CircleAvatar(
                // 프로필 원 생성 위젯
                backgroundColor: Colors.red,
                backgroundImage: AssetImage('images/youngc.png'),
                radius: 50,
              ),
              Text(
                'Young Cheol',
                style: TextStyle(
                    // Text위젯에 property부여해주는 TextStyle
                    fontSize: 40,
                    // 폰트 크기
                    fontWeight: FontWeight.bold,
                    // 폰트 굵기
                    color: Colors.white
                    // 폰트 색
                    ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
