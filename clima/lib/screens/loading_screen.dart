// Package
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    // async와 await
    // GPS 위치를 얻는 것처럼 시간 소요가 되는 작업을 수행할 때 쓴다.
    // 데이터를 다운로드하거나 읽으려고 하는 경우에도 동일하게 쓴다.
    // 비동기 프로그램은 UI를 차단, 앱을 잠시 정지시키고 백그라운드에서 시간이 많이 걸리는 작업을 수행한다.
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    // PermissionDeniedException (User denied permissions to access the device's location.) 에러 발생
    // 사용자에게 위치 정보를 묻는 창이 뜨지 않는 오류로 16번 줄을 추가해서 오류를 해결했다.
    print(position);
    // LocationAccuracy == 위치 정확도
    // 위치 정확도에 따라서 배터리 소모 또한 달라지게 된다.
    // 위치 정확도는 상황에 맞게 사용하면 된다.
    // low의 경우 1KM~500m의 반경을 오차로 갖는다.

    /*  동기식과 비동기식

    비동기식
    각각의 작업이 완료될 때까지 기다릴 필요 없이 각각의 작업이 진행된다.

    동기식
    작업이 완료된 후 다음 작업이 시작된다.

    */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: RaisedButton(
        onPressed: () {
          getLocation();
        },
        child: Text('Get Location'),
      )),
    );
  }
}
