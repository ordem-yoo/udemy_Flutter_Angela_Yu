// Package
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// Page
import 'package:clima/services/networking.dart';
import 'package:clima/screens/location_screen.dart';

// Screen
import 'location_screen.dart';

// Key
const apiKey = '21a6f5286891dd8ccc2a942880607c6e';

class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  // initState 메서드를 사용해서 버튼을 사용하지 않고 자동으로 위치를 찾도록 했다.
  void initState() {
    super.initState();
    getLocationData();
  }

  // 위치를 얻는 메서드
  void getLocationData() async {
    Location location = Location();

    await location.getCurrentLocation();

    // // 위,경도 출력
    print(location.latitude);
    print(location.longtitude);

    NetworkHelper networkHelper = NetworkHelper(
        'http://api.openweathermap.org/data/2.5/forecast?lat=${location.latitude}&lon=${location.longtitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
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
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
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
