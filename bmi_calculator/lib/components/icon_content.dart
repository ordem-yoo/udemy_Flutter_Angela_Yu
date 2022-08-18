// package
import 'package:flutter/material.dart';

// etc
import '../costants.dart';

// 프로퍼티의 상수화
// 하드코딩 된 프로퍼티들을 상수화 시킴으로써 코드를 보기 쉽게 만들 수 있다.
// const labelTextStyle = TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98));

// Widget Refactoring

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.label});

  final IconData? icon;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon, // Refactoring한 위젯을 각각 다르게 쓰기 위해서 변수들로 바꿔준다.
          size: 80.0,
        ),
        SizedBox(height: 15.0),
        Text(label!, // Null-Safety
            style: kLabelTextStyle),
      ],
    );
  }
}
