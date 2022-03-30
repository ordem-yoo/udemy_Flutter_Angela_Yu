import 'dart:math';

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

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  // build 외에 다른 메서드에서 해당 변수에 접근하여햐 하는 경우엔 메서드 밖에서 호출하는게 강제적이다.
  // Stateful Widget에서는 build 메서드 밖 ~ 클래스 안에서 변수 선언을 해도 문제가 없지만,
  // Stateless Widget의 경우 build 메서드 밖 ~ 클래스 안에서 변수 선언을 하면 문제가 생긴다.
  // 문제가 생기는 이유는 Stateless는 build 메서드를 한 번만 호출하기 때문이다.
  // Stateless와 Stateful의 차이점은 동적 변화의 유무도 있다.
  // Stateless는 위 처럼 build메서드를 한 번만 호출하기 때문에 이미지변화, 값의 변화등 UI의 변화가 일어나지 못하지만.
  // Stateful은 이미지변화 ,값의 변화등 UI의 변화가 동적으로 일어난다.
  int leftDiceNumber = 5;
  int rightDiceNumber = 3;

  void changeDicePage() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }
  // 같은 문장이 반복되면 코드의 길이도 길어지고 헷갈릴 수 있다.
  // 함수를 만들면 반복되는 코드의 길이도 줄이고 가독성 또한 높일 수 있다.

  @override
  Widget build(BuildContext context) {
    // build 메서드 안에서 변수 선언을 하면 build 메서드를 호출할때 마다 변수 선언도 같이하게 된다.
    // build 메서드 안에서 변수 선언/ 초기화를 하면 변화가 없을 수 있다.
    // 아래의 코드를 참조하면 bulld 메서드가 어떻게 돌아가는지 알 수 있다.
    // https://dartpad.dev/?id=029b0902bf7ee07a5a5ca4deca5bf596
    // 위 사이트 예시를 해석하자면 위 사이트에 있는 코드는 프로젝트를 처음 생성되는 코드이다.
    // 기본 카운트 앱은 플로팅 버튼을 누르면 화면에 있는 숫자가 증가하는 앱인데 동작은 다음과 같다
    // 버튼을 누르면, 숫자를 증가시키는 함수를 호출하고, 호출된 함수는 build 메서드를 호출하게 된다.
    // 호출하는 과정에서 숫자값을 가지고 있는 변수의 값을 증가시켜 증가하게 된다.
    // build 메서드안에 있게 되면 build 메서드를 호출할때 build 메서드 안에 있는 모든 내용을 다시 호출하게 된다.
    // 이는 변수 선언이 되어 있으면 변수의 값을 바꿀 수 없다는 말과 같다.
    // 따라서 build 메서드 안에서 선언 및 초기화를 할 경우 값이 원하는대로 안바뀔 수 있다는 것이다.
    // int leftDiceNumber = 5;
    // int rightDiceNumber = 3;
    // var는 추론형 타입으로 에러가 발생할 수 있다.
    // 자료형이 확실하다면 자료형을 명시하는게 좋다.

    return Center(
      child: Row(
        children: [
          Expanded(
            child: FlatButton(
              child: Image.asset('images/dice$leftDiceNumber.png'),
              onPressed: () {
                changeDicePage();
              },
            ),
          ),
          Expanded(
            child: FlatButton(
              child: Image.asset('images/dice$rightDiceNumber.png'),
              onPressed: () {
                changeDicePage();
              },
            ),
          ),
        ],
      ),
    );
  }
}

// 57강 까지의 내용

// class DicePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var leftDiceNumber = 5;
//     var rightDiceNumber = 3;

//     return Center(
//       child: Row(
//         children: [
//           Expanded(
//             // 위젯의 크기를 핸드폰 화면에 맞게 확장해주는 위젯
//             // flex property는 화면대비 비율이다.
//             // flex property의 default값은 1이고, Expanded를 기준으로 비율을 잰다.
//             child: FlatButton(
//               // FlatButton 위젯은 단순한 버튼이다.
//               // FlatButton 자체에 내부여백이 존재한다. (오른쪽과 왼쪽)
//               // FlatButton은 Flutter2.0버전에서는 바뀌어서 쓰이지 않는다.
//               child: Image.asset('images/dice$leftDiceNumber.png'),
//               // 문자, 문자열을 표시할 때 ' ' 혹은 " " 을 사용한다. 따옴표 안에 $변수명을 사용하면 변수값을 출력할 수 있다.
//               onPressed: () {
//                 // 버튼을 눌렀을 경우 해당 부분을 실행하게 된다.
//                 // onPressed 함수는 void callback 요구하는 함수이다.
//                 // void callback은 anonymouse function(익명 함수)를 요구한다.
//                 print('Left Button got Pressed');
//                 // print문은 문자, 문자열을 출력하는 역할을 하지만 Dart 외 다른 언어에서도 에러를 확인할 때  쓰인다.
//               },
//             ),
//             // Image 위젯안에서 child를 둘 필요 없이 Image.asset, Image.network로 이미지를 넣을 수 있다. (코드 간결화)
//           ),
//           Expanded(
//             child: FlatButton(
//               child: Image.asset('images/dice$rightDiceNumber.png'),
//               onPressed: () {
//                 print('Right Button got pressed');
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// 59강 Randomising the Dice
//
// return Center(
//       child: Row(
//         children: [
//           Expanded(
//             child: FlatButton(
//               child: Image.asset('images/dice$leftDiceNumber.png'),
//               onPressed: () {
//                 // 버튼을 눌렀을때 실행되는 함수이다.
//                 // onpressed 함수는 단순히 콘솔의 값만 바뀐다.
//                 setState(() {
//                   // build 메서드를 호출하는 함수이다.
//                   // setState 함수는 콘솔의 값도 바뀌지만 화면도 변화를 한다.
//                   leftDiceNumber = Random().nextInt(6) + 1;
//                   // Random class docs https://api.flutter.dev/flutter/dart-math/Random-class.html
//                   // Random 클래스를 사용해서 난수를 생성한다.
//                   // docs에서도 볼 수 있지만 nextInt 메서드는 0부터 ()안에 입력한 숫자-1 까지의 숫자들
//                   // Random 클래스는 dart:math 라이브러리가 있어야 한다.
//                   // import 사용해 라이브러리를 추가한다.
//                   // 메서드로 nextInt를 가지고 있으며 메서드를 사용할 때 함수옆에 .를 입력하고 메서드를 사용한다.
//                   print(leftDiceNumber);
//                 });
//               },
//             ),
//           ),
//           Expanded(
//             child: FlatButton(
//               child: Image.asset('images/dice$rightDiceNumber.png'),
//               onPressed: () {
//                 setState(() {
//                   rightDiceNumber = Random().nextInt(6) + 1;
//                 });
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
