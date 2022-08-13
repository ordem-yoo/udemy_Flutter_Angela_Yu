// Package
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                Expanded(
                    child: ReusableCard(
                  colour: activeCardColour,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: "MALE",
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  colour: activeCardColour,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: "FEMALE",
                  ),
                )),
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
          FontAwesomeIcons.mars,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          'MALE',
          style: TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
        )
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  // const ReusableCard({Key? key,}) : super(key: key);
  // 이 프로젝트에서는 사용 안함
  // key 클래스는 위젯의 상태를 추적할 때 사용한다.
  // 위젯이 위젯 트리에서 움직일 때, 위젯이 바뀔 때 유용하다.

  ReusableCard(
      {required this.colour,
      this.cardChild}); // 위젯의 일부 프로퍼티를 변경할 때 작성해 일부만 바꿀 수 있다.
  // 위젯의 필수 프로퍼티일 경우에는 required 키워드를 쓴다.

  final Color colour; // 프로퍼티 만들기
  final Widget?
      cardChild; // required가 없는 프로퍼티일 경우 null 값으로 설정이 되는데 null-Safety를 위해 위젯 이름 뒤에 ?를 쓴다.

  /*
    final vs const

    https://dartpad.dev/?id=321f61248092bdceb9f9c82b0c182742  
  */

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      // color: Color(0xff1d1e33), // Boxdecoration과 같이 쓸경우 오류가 발생한다.
      // Boxdecoration을 사용할 경우 Boxdecoration안에서 color 프로퍼티로 색상을 지정해주면 된다.
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: colour),
    );
  }
}
