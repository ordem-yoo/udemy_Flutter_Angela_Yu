import 'package:flutter/material.dart';

// 메인 함수는 모든 플러터 앱의 시작점이다.
void main() {
  runApp(
    //앱을 실행시키는 함수
    MaterialApp(
      home: Center(
        //Center 위젯은 중앙에 위젯을 배치시키는 위젯, child는 하위 위젯을 생성할 때 상위 위젯의 속성을 가져온다.
        child: Text('Hello World!'), // Text를 그려주는 위젯
      ),
    ),
  );
}
