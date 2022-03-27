import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Dicee'),
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            // 위젯의 크기를 핸드폰 화면에 맞게 확장해주는 위젯
            // flex property는 화면대비 비율이다.
            // flex property의 default값은 1이고, Expanded를 기준으로 비율을 잰다.
            child: FlatButton(
              // FlatButton 위젯은 단순한 버튼이다.
              // FlatButton 자체에 내부여백이 존재한다. (오른쪽과 왼쪽)
              // FlatButton은 Flutter2.0버전에서는 바뀌어서 쓰이지 않는다.
              child: Image.asset('images/dice1.png'),
              onPressed: () {
                // 버튼을 눌렀을 경우 해당 부분을 실행하게 된다.
                // ()는 void callback 이다.
                print('Left Button got Pressed');
                // print문은 문자, 문자열을 출력하는 역할을 하지만 Dart 외 다른 언어에서도 에러를 확인할 때  쓰인다.
              },
            ),
            // Image 위젯안에서 child를 둘 필요 없이 Image.asset, Image.network로 이미지를 넣을 수 있다. (코드 간결화)
          ),
          Expanded(
            child: FlatButton(
              child: Image.asset('images/dice1.png'),
              onPressed: () {
                print('Right Button got pressed');
              },
            ),
          ),
        ],
      ),
    );
  }
}
