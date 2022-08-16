// Package
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Widget
import 'icon_content.dart';
import 'reusable_card.dart';

// etc
import 'costants.dart';

enum Gender {
  male,
  female,
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            // Expanded 위젯은 위젯의 크기를 핸드폰 화면에 맞춰서 생성해주는 위젯이다.
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: ReusableCard(
                    colour: selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
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
                      selectedGender = Gender.female;
                    });
                  },
                  child: ReusableCard(
                    colour: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
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
          Expanded(
              child: ReusableCard(
            colour: kActiveCardColour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Height',
                  style: kLabelTextStyle,
                ),
                Row(
                  children: [
                    Text(
                      '180',
                      style: kHeightTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    ),
                  ],
                )
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(child: ReusableCard(colour: kActiveCardColour)),
                Expanded(child: ReusableCard(colour: kActiveCardColour)),
              ],
            ),
          ),
          Container(
            color: kBottomContainerColor,
            width: double.infinity, // 최대한 길이로
            height: kBottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
