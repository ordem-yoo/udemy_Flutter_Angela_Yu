// Package
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Widget
import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xFF1D1E33);
const inactiveCardColour = Color(0xff111328);
const bottomContainerColor = Color(0xFFEB1555);

enum Gender {
  male,
  female,
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color maleCardColour = inactiveCardColour;
  Color femaleCardColour = inactiveCardColour;

  // male = 1, female = 2
  void updateColour(Gender selectedGender) {
    // male card를 눌렀을 때
    if (selectedGender == Gender.male) {
      if (maleCardColour == inactiveCardColour) {
        maleCardColour = activeCardColour;
        femaleCardColour =
            inactiveCardColour; // 둘 다 선택할 수 없기 때문에 반대 성별은 꺼지도록 만든다.
      } else {
        maleCardColour = inactiveCardColour;
      }
    }
    // female card를 눌렀을 때
    if (selectedGender == Gender.female) {
      if (femaleCardColour == inactiveCardColour) {
        femaleCardColour = activeCardColour;
        maleCardColour = inactiveCardColour;
      } else {
        femaleCardColour = inactiveCardColour;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            // Expanded 위젯은 위젯의 크기를 핸드폰 화면에 맞춰서 생성해주는 위젯이다.
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateColour(Gender.male);
                    });
                  },
                  child: ReusableCard(
                    colour: maleCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: "MALE",
                    ),
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateColour(Gender.female);
                    });
                  },
                  child: ReusableCard(
                    colour: femaleCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: "FEMALE",
                    ),
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
