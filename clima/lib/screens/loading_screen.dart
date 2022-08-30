// Package
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

// Screen
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override

  // initState 메서드를 사용해서 버튼을 사용하지 않고 자동으로 위치를 찾도록 했다.
  void initState() {
    super.initState();
    getLocation();
    print("this line of code is triggered");
    getData();
  }

  // 위치를 얻는 메서드
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    // print(location.latitude);
    // print(location.longtitude);
  }

// http 라이브러리의 버전이 0.13.3 이상부터 올라가면서 Uri를 사용해야 한다.

// 기존 코드
// Response response =await get(
//  'https://samples.openweathermap.org/data/2.5/weather?lat=37&lon=126&appid=183a2973823402fd1de3aaf3a23e0c36');

// 변경된 코드
  void getData() async {
    // Json (JavaScript Obejct Notation)
    // 자바 스크립트 객체 표기법이며, Dart에 있는 Map과 유사하다.
    Response response = await get(Uri.parse(
        'https://samples.openweathermap.org/data/2.5/weather?lat=37&lon=126&appid=183a2973823402fd1de3aaf3a23e0c36'));

    // API에 연결에 대한 조건문
    if (response.statusCode == 200) {
      // 요청 본문 값을 data 변수에 넣는다.
      String data = response.body;
      //print(data);

      // //_TypeError [solved] URL typo
      // var longitude = jsonDecode(data)['coord']['lon'];
      // //print(longitude);

      // var weatherDescription = jsonDecode(data)['weather'][0]['description'];
      // // []안에 있는 애들을 '키'라고 한다.
      // // ['weather'] 다음에 숫자 0이 있는 이유는 json data의 구조에서 키의 이름이 없기 때문이다.
      // // [0]다음에 오는 최종 키는 description 이라는 이름이 있기 때문에 ['description'] 이라고 썼다.
      // print(weatherDescription);

      // // Challenge
      var temperature = jsonDecode(data)['main']['temp'];
      print(temperature);

      var name = jsonDecode(data)['name'];
      print(name);

      var id = jsonDecode(data)['weather'][0]['id'];
      print(id);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    // String myMargin = 'abc';
    // double? myMarginAsADouble;

    // // try catch문 예시
    // try {
    //   myMarginAsADouble = double.parse(myMargin);
    // } catch (e) {
    //   print(e);
    // }
    // return Scaffold(
    //     body: Container(
    //   margin: EdgeInsets.all(myMarginAsADouble ??
    //       30.0), // ?? 와 값을 쓰면 해당 변수 값이 null이라면 ?? 뒤에 오는 값을 쓰겠다는 말이다.
    //   color: Colors.red,
    // )
    //
    // 버튼을 통해 GPS 정보 받기
    // body: Center(
    //     child: RaisedButton(
    //   onPressed: () {
    //     getLocation();
    //   },
    //   child: Text('Get Location'),
    // )),
    // );
    return Scaffold(body: Container());
  }
}

/* API (Application Programming Interfaces)
   프로그래머가 소프트웨어를 만들거나 외부 시스템과 상호 작용하는 데 사용할 수 있는 명령, 기능, 프로토콜 및 객체 집합이다.
   API는 개발자가 일반적인 작업을 수행하기 위한 표준 명령을 제공해야 한다.

   API가 사용되는 경우를 예를 들어 설명하면
   어떤 앱에서 공유된 친구 및 공유에 대한 섹션이 있다고 하면
   그 앱에서 SNS나 다른 곳에서 특정 데이터를 얻어 왔을 것이다.
   특정 데이터를 얻기 위해서는 요청을 할 것이고 요청한 데이터를 받을 것이다.

   정보를 얻는 과정에서 키가 필요하다.
   예를들어 은행에서 돈을 인출할때 인출한다고 말을하고 돈을 인출하는게 아니다.
   인출을 하기 위해 비밀번호가 필요하다.
   마찬가지로 API에서 데이터를 얻기 위해 API키가 필요하다.
*/
