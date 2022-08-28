import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('I am rich'),
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/diamond.png'),
            // 앱 아이콘은 프로젝트폴더/android/app/src/main/res에 있다.
            // mipmap폴더들 안에 크기가 다른 아이콘 이미지가 있다.
            // mipmap폴더들을 모두 지운다.
            // https://appicon.co 에 접속하여 아이콘은 제작하고 다운로드 받는다.
            // 다운로드 받은 파일의 압축을 해제하고 AppIcons/android 로 이동한다.
            // mipmap폴더들을 모두 복사해서 프로젝트폴더/android/app/src/main/res에 넣는다.
            // 앱을 다시 실행시키면 아이콘이 적용된다.
          ),
        ),
      ),
    ),
  );
}
