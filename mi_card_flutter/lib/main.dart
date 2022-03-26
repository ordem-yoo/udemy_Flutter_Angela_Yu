import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            // 수직축으로 위젯을 넣을 수 있는 위젯
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // crossAxisAlignment는 Row에서 적용되는 property이다.
            // .stretch는 아래의 Row와 같이 동일하게 적용된다.
            verticalDirection: VerticalDirection.up,
            // verticalDirection property는 위젯 배치의 시작점 설정한다. down이 default 값으로 위에서 아래로 배치한다.
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                color: Colors.white,
                child: Text('Container 1'),
              ),
              Container(
                width: 100,
                // double.infinity를 사용하면 화면 끝까지로 설정된다.
                height: 100,
                // double.infinity를 사용하면 화면 끝까지로 설정된다.
                color: Colors.red,
                child: Text('Container 2'),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Text('Container 3'),
              ),
              SizedBox(
                // 빈공간을 만들어주는 위젯
                height: 10,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.yellow,
                child: Text('Container 4'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

// 39강 Mikcard App - padding, margin, EdgeInsets
// Scaffold(
//         backgroundColor: Colors.teal,
//         body: SafeArea(
//           // SafeArea 위젯이 없으면 스마트폰의 베젤에 위젯이 붙게된다.
//           child: Container(
//             // Container 위젯은 child가 없어도 쓸 수 있다. Container 위젯의 크기는 Container안 child에 있는 위젯의 크기에 맞춰지며 child가 없으면 크기가 부모의 크기에 맞춰진다.
//             height: 100,
//             width: 100,
//             // Container의 크기 지정
//             margin: EdgeInsets.all(10),
//             // all은 상하좌우 묶어서, symmetric은 상하, 좌우 묶어서, fromLTRB는 상하좌우 각각 only는 한 방향만 값을 준다.
//             padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//             // margin은 바깥 여백을 조정하고 padding은 안쪽 여백을 조정한다.
//             color: Colors.white,
//             // child가 없으면 부모인 Scaffold 위젯에 크기를 맞추고 색을 채운다.
//             child: Text('Hello'),
//             // Text 위젯을 작성하면 Container 위젯의 크기는 Text 위젯의 크기에 맞춰진다.
//           ),
//         ),
//       ),

// 42강 Mikcard App - Row(mainAxisAlignment, mainAxisSize, verticalDirection)
// Row(
//   // 수평축으로 위젯을 넣을 수 있는 위젯
//   mainAxisAlignment: MainAxisAlignment.end,
//   // mainAxisAlignment : Row 위젯 안 위젯들을 정렬하는 property
//   // .cneter 중앙  .start Row 위젯 영역 시작지점으로  .end Row 영역 끝지점으로
//   // .spaceAround 첫 위젯의 앞과 마지막 위젯의 뒤의 여백 같게, 사이 위젯은 균등하게 여백 분배
//   // .spaceBetween  위젯 사이 여백 넣기  .spaceEvenly 위젯의 앞, 뒤 여백 배치, 여백은 모두 같은 크기로 배치
//   mainAxisSize: MainAxisSize.max,
//   // Row의 영역 최소로 축소 위젯의 여백을 주게 되었다면 여백은 사라지게 된다.
//   crossAxisAlignment: CrossAxisAlignment.stretch,
//   // crossAxisAlignment는 Column위젯에서 정렬을 하는 방법이다.
//   // .start  .end  .center 는 적용이 안된다.
//   // .stretch는 적용이 된다.  .stretch는 단어 뜻과 같이 위젯의 영역을 늘려주는 property이다.
//   verticalDirection: VerticalDirection.up,
//   // verticalDirection property 또한 Column위젯으로 적용된다.
//   // VerticalDirection 과 같은 property를 주고 싶다면
//   // mainAxisAlignment에서 end를 주면 된다.
//   children: <Widget>[
//     Container(
//       color: Colors.white,
//       height: 50,
//       width: 50,
//       child: Text('Container 1'),
//     ),
//     Container(
//       color: Colors.red,
//       height: 50,
//       width: 70,
//       child: Text('Container 2'),
//     ),
//     Container(
//       color: Colors.blue,
//       height: 50,
//       width: 70,
//       child: Text('Container 3'),
//     ),
//     Container(
//       color: Colors.purple,
//       height: 50,
//       width: 50,
//       child: Text('Container 4'),
//     ),
//   ],
// ),
