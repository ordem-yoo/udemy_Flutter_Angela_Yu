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
                'YoungCheol',
                style: TextStyle(
                    // Text위젯에 property부여해주는 TextStyle property
                    fontFamily: 'Pacifico',
                    // 폰트 종류 property
                    // 폰트 종류 설정을 위해 프로젝트 디렉토리에 fonts라는 디렉토리를 생성한다.
                    // 생성한 디렉토리에 다운로드 받은 폰트명.ttf 파일을 드래그한다.
                    // pubspec.yaml로 가서 폰트에 대한 정보를 입력한다.
                    // https://flutter.dev/custom-fonts/#from-packages 이 사이트를 참고하면 좋다.
                    // fonts 부터 asset 부분을 주석 해제하고 family에는 폰트명 asset에는 폰트가 있는 주소를 입력한다.
                    // package get 해주고 앱을 다시 실행하면 된다.
                    fontSize: 40,
                    // 폰트 크기 property
                    fontWeight: FontWeight.bold,
                    // 폰트 굵기 property
                    color: Colors.white
                    // 폰트 색 property
                    ),
              ),
              Text(
                "NYAHAN NAMJA",
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 20,
                  letterSpacing: 2.5,
                  // 자간 설정 property
                  color: Colors.white,
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      color: Colors.teal,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      '082+ 123 4567 8910',
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                color: Colors.white,
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.mail,
                      color: Colors.teal,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'youngcheol@email.com',
                      style: TextStyle(
                          color: Colors.teal.shade900,
                          fontSize: 20.0,
                          fontFamily: 'Sourse Sans Pro'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
