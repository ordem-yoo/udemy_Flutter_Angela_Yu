import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

// http 라이브러리의 버전이 0.13.3 이상부터 올라가면서 Uri를 사용해야 한다.

// 기존 코드
// Response response =await get(
//  'http://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$logitude&appid=$apikey');

// api 보기
//http://api.openweathermap.org/data/2.5/forecast?lat=37.6&lon=126.7&appid=21a6f5286891dd8ccc2a942880607c6e

// 변경된 코드
  Future getData() async {
    // Json (JavaScript Obejct Notation)
    // 자바 스크립트 객체 표기법이며, Dart에 있는 Map과 유사하다.
    Response response = await get(Uri.parse(url));

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
      // // json data를 가져오는 변수 3개 만들기
      // var temperature = jsonDecode(data)['main']['temp'];
      // print(temperature);

      // var name = jsonDecode(data)['name'];
      // print(name);

      // var id = jsonDecode(data)['weather'][0]['id'];
      // print(id);
      // // 코드 양을 줄이고 싶다면 jsonDecode(data)를 변수에 넣으면 된다.
      // var decodedData = jsonDecode(data);

      // 변수에 덜 명시적인 var 타입을 주는 이유는 jsondata가 동적 유형이며 데이터가 처리 될 때까지 어떤 타입이 될지 모르기 때문이다.
      // 예를 들어 온도에 int를 주게 된다면 type_error가 발생할 것이다.

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
