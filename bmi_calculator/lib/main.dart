// Package
import 'package:flutter/material.dart';

// Page
import 'package:bmi_calculator/screens/home.dart';

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
        scaffoldBackgroundColor: Color(0xff0a0e21),
        /* 테마를 여기에 두면 모든 슬라이더 위젯을 같은 테마로 사용할 수 있다.
          sliderTheme: SliderTheme.of(context).copyWith(
                      // SliderThemeData를 통해서 다양한 프로퍼티들을 설정할 수 있지만 전부 다 설정할 것은 아니기 때문에 기존의 테마를 그대로 쓰는 의미로 다크 테마와 동일하게 copyWith를 사용하고 일부 프로퍼티만 변경했다.
                      // context는 앱의 현재 상태를 의미한다.
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x15EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)),
          */
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
        ),
        body: Home(),
      ),
    ),
  );
}
