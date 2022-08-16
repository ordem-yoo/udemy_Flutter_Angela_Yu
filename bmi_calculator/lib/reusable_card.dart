import 'package:flutter/material.dart';

// Widget Refactoring

class ReusableCard extends StatelessWidget {
  // const ReusableCard({Key? key,}) : super(key: key);
  // 이 프로젝트에서는 사용 안함
  // key 클래스는 위젯의 상태를 추적할 때 사용한다.
  // 위젯이 위젯 트리에서 움직일 때, 위젯이 바뀔 때 유용하다.

  ReusableCard({required this.colour, this.cardChild});
  // 위젯의 일부 프로퍼티를 변경할 때 작성해 일부만 바꿀 수 있다.
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
