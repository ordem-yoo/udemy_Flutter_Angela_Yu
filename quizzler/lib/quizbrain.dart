import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  // 변수명 앞에 _를 사용해서 다른 곳에서 접근하지 못하도록 할 수 있다.

  List<Question> _questionBank = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  // 접근이 제한된 변수를 사용하기 위해 함수로 만들어서 사용했다.
  void nextQuestion() {
    print(_questionNumber);
    // List의 개수가 초과했을 때 range에러가 발생하는 것을 방지하기 위해 if 문을 사용했다.
    if (_questionNumber < _questionBank.length - 1) {
      // List 안에 있는 질문은 총 13개가 있다.
      // _questionNumber는 List에 있는 질문을 사용하기 위해, 0으로 초기화 했다.
      // List는 배열과 동일하게 index가 0번째 부터 시작된다.
      // 즉, 13개의 질문은 0 ~ 12의 index를 가지게 된다.
      // _questionBank.length는 _questionBank의 길이 즉, List에 있는 질문의 개수를 말한다.
      // 13개의 질문이 있기 때문에 값을 출력하면 13으로 나온다.
      // print를 통해 두 변수의 값을 비교했다.
      // number               = 1  2  3  4  5  6  7  8  9  10 11  12  13  14
      // _questionNumber      = 0  1  2  3  4  5  6  7  8  9  10  11  12  13
      // _questionBank.length = 13 13 13 13 13 13 13 13 13 13 13  13  13  13
      // 질문의 개수는 13개인데 13번에서 _questionNumber가 12이기 때문에 1번 더 if문의 코드를 수행하고 따라서 오류가 발생한 것이다.
      // _questionBank.length에서 -1 을 해서 13번에서 if문을 중단시켜 오류 발생을 방지한다.
      _questionNumber++;
      print(_questionNumber);
      print(_questionBank.length);
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getAnswerText() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      print('returned true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
// 캡슐화
