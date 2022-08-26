// Package
import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude; // 위도
  double? longtitude; // 경도

  Future<void> getCurrentLocation() async {
    // try catch 적용
    try {
      // throw
      // throw는 예외를 강제적으로 발생시켜할 경우 사용한다.
      // 예외를 강제적으로 발생시키는 이유는 객체를 잘못 사용하는 사용자에게 예외를 강제로 발생시켜서 사용자에게 주의를 줄 수 있고,
      // 예외와 관련된 처리를 해달라고 부탁할 수 있다.

      // try catch 예시
      //somethingThatExpectsLessThan10(12);

      // async와 await
      // GPS 위치를 얻는 것처럼 시간 소요가 되는 작업을 수행할 때 쓴다.
      // 데이터를 다운로드하거나 읽으려고 하는 경우에도 동일하게 쓴다.
      // 비동기 프로그램은 UI를 차단, 앱을 잠시 정지시키고 백그라운드에서 시간이 많이 걸리는 작업을 수행한다.
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      // PermissionDeniedException (User denied permissions to access the device's location.) 에러 발생
      // 사용자에게 위치 정보를 묻는 창이 뜨지 않는 오류 때문에 LocationPermission permission = await Geolocator.requestPermission();을 추가해서 오류를 해결했다.
      // GPS의 현재 위치 출력
      // print(position);
      // LocationAccuracy == 위치 정확도
      // 위치 정확도에 따라서 배터리 소모 또한 달라지게 된다.
      // 위치 정확도는 상황에 맞게 사용하면 된다.
      // low의 경우 1KM~500m의 반경을 오차로 갖는다.

      latitude = position.latitude;
      longtitude = position.longitude;
    } catch (e) {
      print(e);
    }

    /*  동기식과 비동기식

    비동기식
    각각의 작업이 완료될 때까지 기다릴 필요 없이 각각의 작업이 진행된다.

    동기식
    작업이 완료된 후 다음 작업이 시작된다.

    */

    /* 참고 : https://jaceshim.github.io/2019/01/28/flutter-study-stateful-widget-lifecycle/ 
      플러터가 Stateful Widget(상태를 저장하는 위젯)을 만들 때 State 객체를 만든다.
      State객체는 해당 위젯의 모든 가변 상태가 유지되는 곳이다.

      State의 개념은 두가지가 있다.
      1. 위젯이 사용하는 데이터는 변경될 수 있다.
      2. 위젯이 빌드될 때 데이터를 동시에 읽을 수 없다.

    
    상태 클래스 initState, deactivate 메서드
      
    1. 상태 클래스 initState 메서드
       위젯이 생성될 때 처음 호출되는 메서드
       stateful Widget 을 만들고, stateful Widget이 위젯 트리에 들어가게 되면 initState 메소드를 호출할 수 있다.
       initState 메서드는 stateful Widget 만들어질 때 작업이 수행되길 원하면 사용하고, initState 메서드 안에 수행하고 싶은 작업을 넣으면 된다.
       
       ex)
       ...
       class _ScreenState extends State<Screen2>{
        @override
        void initState(){
          super.initState();
          print('initState Called');
        }
       }


    2. deactivate 메서드
       initState 메서드와 다르게 Stateful Widget이 사라질 때 사용하는 메서드다.

       ex)
       ...
       class _ScreenState extends State<Screen2>{
        @override
        void deactivate(){
          super.deactivate();
          print('initState Called');
        }
       }
    
    */
  }
}

void somethingThatExpectsLessThan10(int n) {
  if (n > 10) {
    throw 'n is greater than 10, n should always be less than 10.';
  }
}
