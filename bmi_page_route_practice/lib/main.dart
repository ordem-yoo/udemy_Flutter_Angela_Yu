import 'package:bmi_page_route_practice/screen1.dart';
import 'package:bmi_page_route_practice/screen2.dart';
import 'package:flutter/material.dart';

// Page
import 'screen0.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      // 화면을 이동하기 위해 키를 만든다고 생각한다.
      '/': (context) => Screen0(),
      '/first': (context) => Screen1(),
      '/second': (context) => Screen2(),
    });
  }
}
