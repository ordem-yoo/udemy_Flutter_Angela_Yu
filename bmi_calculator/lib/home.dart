// Package
import 'package:flutter/material.dart';

const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xFF1D1E33);
const bottomContainerColor = Color(0xFFEB1555);

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            // Expanded 위젯은 위젯의 크기를 핸드폰 화면에 맞춰서 생성해주는 위젯
            child: Row(
              children: [
                Expanded(child: ReusableCard(colour: activeCardColour)),
                Expanded(child: ReusableCard(colour: activeCardColour)),
                // Extract Widget을 통해서 반복되는 위젯을 함수처럼 축약할 수 있다.
                // 위젯 일부만 변경하기 위해 프로퍼티를 추가했다면 null 값을 쓸 수 없다.
              ],
            ),
          ),
          Expanded(child: ReusableCard(colour: activeCardColour)),
          Expanded(
            child: Row(
              children: [
                Expanded(child: ReusableCard(colour: activeCardColour)),
                Expanded(child: ReusableCard(colour: activeCardColour)),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            width: double.infinity, // 최대한 길이로
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  // const ReusableCard({Key? key,}) : super(key: key);
  // 이 프로젝트에서는 사용 안함
  // key 클래스는 위젯의 상태를 추적할 때 사용한다.
  // 위젯이 위젯 트리에서 움직일 때, 위젯이 바뀔 때 유용하다.

  ReusableCard({required this.colour}); // 위젯의 일부 프로퍼티를 변경할 때 작성해 일부만 바꿀 수 있다.

  final Color colour; // 프로퍼티 만들기

  /*
    final vs const

    https://dartpad.dev/?id=321f61248092bdceb9f9c82b0c182742  
  */

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color(0xff1d1e33), // Boxdecoration과 같이 쓸경우 오류가 발생한다.
      // Boxdecoration을 사용할 경우 Boxdecoration안에서 color 프로퍼티로 색상을 지정해주면 된다.
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: colour),
    );
  }
}
