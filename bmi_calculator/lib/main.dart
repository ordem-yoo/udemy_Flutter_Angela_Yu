// Package
import 'package:flutter/material.dart';

// Page
import 'package:bmi_calculator/home.dart';

void main() {
  runApp(
    MaterialApp(
      title: "BMI Calculator",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          // 기존의 테마가 아닌 다크 테마를 사용한다.
          // 위젯 기존 속성값은 그대로 사용하면서 변경하려는 속성값의 코드만 작성하려면 copywith를 사용한다.
          appBarTheme: AppBarTheme(
              backgroundColor: Color(0xff0a0e21),
              textTheme:
                  TextTheme(bodyText1: TextStyle(color: Color(0xffffffff)))),
          scaffoldBackgroundColor: Color(0xff0a0e21)),
      home: Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
        ),
        body: Home(),
      ),
    ),
  );
}
