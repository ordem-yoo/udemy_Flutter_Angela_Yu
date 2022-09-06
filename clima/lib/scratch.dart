// 비동기식 동기식 이해 예제

import 'dart:io';

void main() {
  // synchronousPerformTasks();
  //asynchronousPerfomeTasks();
  //asynchronousPerfomeTasks2();
  instanceReturn();
}

// 이 함수를 실행했을때 task2에서 시간이 걸리는 것을 볼 수 있다.
// 이 코드를 통해 앱에서 작업을 수행할 경우 데이터를 다운로드 받는다던지 시간이 많이 소요되는 작업을 동기식으로 수행할 때 시간이 걸리는 작업에서 시간이 걸릴 때 다음 작업이 영향을 받는것을 알 수 있다.

// 동기식 코드 예제
// 123으로 작업을 수행한다.

void synchronousPerformTasks() {
  task1();
  task2();
  task3();
}

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
// 465식으로 작업을 수행한다.

void asynchronousPerfomeTasks() {
  task4();
  task5();
  task6();
}

void task4() {
  String result = 'task 4 data';
  print('Task 4 complete');
}

void task5() {
  Duration threeSeconds = Duration(seconds: 3);
  Future.delayed(threeSeconds, () {
    // Future.delayed의 설명을 보면 Future.delayed는 두 개의 프로퍼티를 입력할 수 있다.
    // duration과 콜백을 입력할 수 있고 콜백에 수행할 작업이 들어가면 duration에서 지정한 시간이 지난 후 수행하게 된다.

    String result = 'task 5 data';
    print('Task 5 complete');
  });
}

void task6() {
  String result = 'task 6 data';
  print('Task 6 complete');
}

// 비동기식 코드 예제2
// 비동기된 작업이 다음 작업 진행을 위해 비동기된 작업의 결과가 필요한(의존하는) 경우
// 798식으로 작업을 진행한다.
// 비동기식 코드 예제1과 차이점은 8번의 결과가 9번 작업에 의존해야 하는데 8번에서 결과 값이 null인 상태로 수행한다.
// 결과값이 들어간 상태로 작업이 되려면 async와 await을 함수에 적용시켜야 한다.
// null-safety reference
// https://gist.github.com/yogithesymbian/66a6008ee96c5cded9544f82c7d293f7
//
// Future, async, await reference
// https://velog.io/@jintak0401/FlutterDart-%EC%97%90%EC%84%9C%EC%9D%98-Future-asyncawait

// line 97, udemy 7:40

void asynchronousPerfomeTasks2() async {
  // 비동기 처리를 위해 async를 추가한다.
  task7();
  String? task8Result = await task8();
  // task8의 결과를 task8Result변수에 넣는다.
  // async를 추가하면 await 키워드에 액세서 할 수 있다.
  // await이 없으면 동기적으로 실행된다.
  task9(task8Result); // task8Result를 task9함수에 넣는다.
  print(task10);
}

void task7() {
  String result = 'task 7 data';
  print('task 7 complete');
}

Future<String?> task8() async {
  Duration threeSeconds = Duration(seconds: 3);

  String? result;

  await Future.delayed(threeSeconds, () {
    result = 'task 8 data';
    print('task 8 complete');
  });
  return result;
  // task8의 결과를 반환
}

// task8에 의존하는 경우를 위해 task8Data를 task9함수의 인자에 넣었다.
void task9(String? task8Data) {
  String result = 'task9 data';
  print('task 9 complete with $task8Data');
}

// Future, await, async의 동작을 알 수 있는 보너스 예제

// Future는 JS에서의 promise와 대응한다.
// JS의 promise는 특정 동작의 수행이 완료되면 다음 동작을 수행하겠다는 약속,
// Dart의 Future는 지금은 없지만 미래에 요청한 데이터 혹은 에러가 담길 그릇 이라고 보면 된다.

// 아래 함수를 실행 시켰을때 task10 함수의 첫 반환형은 Future<String?>이다.
// 3초 후 task 10 complete 라고 다시 나오게 된다.
// 지금은 없지만 미래에 요청한 데이터를 불러왔기 때문인데
// 지금이라고 하는 task10함수 출력 타이밍에서 Future<string?>에 대한 반환값이 없기 때문에 Instance of Future<Strinf?>이라고 한다.

void instanceReturn() async {
  task7();
  print(task10());
}

Future<String?> task10() async {
  Duration threeSeconds = Duration(seconds: 3);

  String? result;

  await Future.delayed(threeSeconds, () {
    result = 'task 10 data';
    print('task 10 complete');
  });
  return result;
  // task10의 결과를 반환
}
