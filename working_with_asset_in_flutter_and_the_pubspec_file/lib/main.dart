import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('I am Youngcheol!'),
        ),
        body: Center(
          child: Image(
            //프로젝트 폴더 안에 저장된 이미지를 사용할 때 AssetImage를 쓴다.
            image: AssetImage('images/youngcheol.jpg'),
          ),
        ),
      ),
    ),
  );
}
