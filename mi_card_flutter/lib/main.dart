import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          // SafeArea 위젯이 없으면 스마트폰의 베젤에 위젯이 붙게된다.
          child: Container(
            // Container 위젯은 child가 없어도 쓸 수 있다. Container 위젯의 크기는 Container안 child에 있는 위젯의 크기에 맞춰지며 child가 없으면 크기가 부모의 크기에 맞춰진다.
            height: 100,
            width: 100,
            // Container의 크기 지정
            margin: EdgeInsets.all(10),
            // all은 상하좌우 묶어서, symmetric은 상하, 좌우 묶어서, fromLTRB는 상하좌우 각각 only는 한 방향만 값을 준다.
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            // margin은 바깥 여백을 조정하고 padding은 안쪽 여백을 조정한다.
            color: Colors.white,
            // child가 없으면 부모인 Scaffold 위젯에 크기를 맞추고 색을 채운다.
            child: Text('Hello'),
            // Text 위젯을 작성하면 Container 위젯의 크기는 Text 위젯의 크기에 맞춰진다.
          ),
        ),
      ),
    ),
  );
}
