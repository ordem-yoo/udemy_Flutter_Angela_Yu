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
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment:
            CrossAxisAlignment.stretch, // Column의 container들을 가로로 꽉차게 하는 프로퍼티다.
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
              mainAxisAlignment: MainAxisAlignment
                  .center, // Column위젯에 속한 위젯들을 전부 (세로축)가운데 정렬한다.
              children: [
                Text('Height', style: kLabelTextStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Row위젯에 속한 위젯들을 전부 (가로축)가운데 정렬한다.
                  crossAxisAlignment: CrossAxisAlignment
                      .baseline, // textBaseline 프로퍼티가 없으면 에러가 발생한다.
                  textBaseline: TextBaseline
                      .alphabetic, // textBaseline 프로퍼티를 통해 서로 다른 위젯, 폰트의 기준을 잡아주는 역할을 한다.
                  children: [
                    Text(height.toString(),
                        style:
                            kHeightTextStyle), // Text 위젯에는 String 자료형만 들어갈 수 있기 때문에 .toString()을 붙여준다.
                    Text('cm', style: kLabelTextStyle),
                  ],
                ),
                SliderTheme(
                  // 내가 원하는 테마로 슬라이더를 사용하기 위해 SliderTheme을 사용했다.
                  data: SliderTheme.of(context).copyWith(
                      // SliderThemeData를 통해서 다양한 프로퍼티들을 설정할 수 있지만 전부 다 설정할 것은 아니기 때문에 기존의 테마를 그대로 쓰는 의미로 다크 테마와 동일하게 copyWith를 사용하고 일부 프로퍼티만 변경했다.
                      // context는 앱의 현재 상태를 의미한다.
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x15EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0)),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue) {
                      // onChange는 텍스트 값을 계속 바꿔야할 때 사용하는 프로퍼티이다.
                      setState(() {
                        height = newValue
                            .round(); // height는 int지만 newValue는 double이기때문에 반올림 해주는 함수 round()를 사용했다.
                      });
                    },
                  ),
                ),
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              }),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(age.toString())
                    ],
                  ),
                )),
              ],
            ),
          ),
          Container(
            color: kBottomContainerColor,
            width: double.infinity, // 화면에서 최대로 가질 수 있는 값을 의미한다.
            height: kBottomContainerHeight,
          ),
        ],
      ),
    );
  }
}

// 커스텀 floatingActionButton 만들기

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback
      onPressed; // 강의에서는 Function으로 했지만 null safety의 문제로 VoidCallback으로 바꿔야 한다.
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 0.0,
      disabledElevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
