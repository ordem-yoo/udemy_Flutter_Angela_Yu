// 비동기식 동기식 이해 예제

import 'dart:io';

void main() {
  performTasks();
}

// 이 함수를 실행했을때 task2에서 시간이 걸리는 것을 볼 수 있다.
// 이 코드를 통해 앱에서 작업을 수행할 경우 데이터를 다운로드 받는다던지 시간이 많이 소요되는 작업을 동기식으로 수행할 때 시간이 걸리는 작업에서 시간이 걸릴 때 다음 작업이 영향을 받는것을 알 수 있다.
void performTasks() {
  task1();
  task2();
  task3();
}

// 동기식 코드 예제
void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

void task2() {
  // 동기식을 이해하기 위해 Duration 객체를 만들었다.
  Duration threeSeconds = Duration(seconds: 3);
  sleep(threeSeconds);

  // 위 코드가 실행된 후 아래의 작업을 수행한다.
  String result = 'task 2 data';
  print('Task 2 complete');
}

void task3() {
  String result = 'task 3 data';
  print('Task 3 complete');
}

// 비동기식 코드 예제

void task4() {
  String result = 'task 4 data';
  print('Task 4 complete');
}

void task5() {
  Duration threeSeconds = Duration(seconds: 3);
  Future.delayed(threeSeconds, () {});
  // Future.delayed의 설명을 보면 Future.delayed는 두 개의 프로퍼티를 입력할 수 있다.
  // duration과 콜백을 입력할 수 있고 콜백에 수행할 작업이 들어가면 duration에서 지정한 시간이 지난 후 수행하게 된다.

  String result = 'task 5 data';
  print('Task 5 complete');
}

void task6() {
  String result = 'task 6 data';
  print('Task 6 complete');
}
