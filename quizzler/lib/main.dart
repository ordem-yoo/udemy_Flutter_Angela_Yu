// Package
import 'package:flutter/material.dart';

// Page

import 'quizbrain.dart';

// 객체를 사용하기 위해 생성자를 호출했다.
QuizBrain quiz = QuizBrain();
void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // data를 group하는것을 Collectiion이라고 한다.
  // Collection하기 위해선 List를 사용한다.
  // 다른 프로그래밍 언어에서 배열을 사용하듯이 List를 배열로 생각하고 선언하면 된다.
  // 변수명 앞에 <>를 통해서 하나의 data type만 담을 수 있도록 한다.
  // 예를들어 List <int> number = []; 라고하면 [] 안에는 정수형의 data만 들어간다.
  // <>가 없는 List라면 []안에 들어가는 data의 type은 dynamic이 된다.
  // dynamic을 통해 data의 type을 유동적으로 받는 변수를 만들 수 있지만 에러발생 가능성이 크다.
  // 따라서 유동적인 data type이 필요한 경우가 아니라면 명시하는게 좋다.
  // 아래에서 <Icon>을 해도 된다. []안의 위젯이 전부 Icon이기 때문에 가능한것이다.

  // 정답 표시
  List<Icon> scoreIcon = [];

  // // 문제 목록
  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.',
  // ]; // 특수문자 중 다른 역할로 사용되고 있는 특수문자들은 \(역슬래시) 사용해서 표현한다.

  // // 정답 목록
  // List<bool> answers = [
  //   false,
  //   true,
  //   true,
  // ];

  // // 문제와 정답을 한 번에 저장하기 위해서 클래스를 생성했다.
  // // question.dart 참조
  // // Question('문제', 정답) 으로 구성되어 있고,
  // // Question을 하나의 List로 묶을 수 있다.
  // List<Question> questionBank = [
  //   Question('You can lead a cow down stairs but not up stairs.', false),
  //   Question('Approximately one quarter of human bones are in the feet.', true),
  //   Question('A slug\'s blood is green.', true),
  // ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quiz.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                // 버튼 값 변수에 저장
                bool correctAnswer = quiz.getAnswerText();

                // 정답 확인
                if (correctAnswer == true) {
                  print('user got it right');
                } else {
                  print('user got it wrong');
                }

                setState(() {
                  scoreIcon.add(
                    const Icon(
                      Icons.check_box,
                      color: Colors.green,
                    ),
                  );
                  quiz.nextQuestion();
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              // 버튼을 눌렀을 때 {}안 코드를 수행하게 하는 함수
              onPressed: () {
                // setState는 이전에 설명한 것처럼 build method를 호출하는 함수이다.
                // setState가 없으면 계속 build를 하지 못해 콘솔에서만 내용이 남는다.

                // 버튼 값 변수에 저장
                bool correctAnswer = quiz.getAnswerText();

                // 정답 확인
                if (correctAnswer == true) {
                  print('user got it right');
                } else {
                  print('user got it wrong');
                }

                setState(
                  () {
                    // List에서 data를 추가하려면 Collection명.add를 사용한다.
                    // 반대로 지우려면 Collection명.removeAt(index number)로 지운다.
                    scoreIcon.add(
                      const Icon(
                        // 아이콘 위젯 FontAwesome Package를 통해서 좋은 아이콘을 사용할 수 있다.
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                    quiz.nextQuestion(); // questionNumber = questionNumber + 1 코드를 줄일수 있다.
                  },
                );
              },
            ),
          ),
        ),
        // scoreIcon은 List type으로 된 Collection이다.
        // Collection이 children의 []역할을 대신하므로 children: scoreIcon이 가능하다.
        Row(
          children: scoreIcon,
        )
      ],
    );
  }
}
