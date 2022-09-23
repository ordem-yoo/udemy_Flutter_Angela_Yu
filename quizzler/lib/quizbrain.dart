import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  // 변수명 앞에 _를 사용해서 다른 곳에서 접근하지 못하도록 할 수 있다.

  List<Question> _questionBank = [
    Question('Ordem은 ISTJ입니다.', true),
    Question('Ordem의 장래희망은 웹 개발자입니다.', false),
    Question('Ordem이 가장 많이 보유한 이모티콘 시리즈는 \n 냐한남자 시리즈 입니다.', false),
    Question('Ordem은 축구를 좋아합니다.', true),
    Question('Ordem이 제일 좋아하는 노래는\n 마마무의 데칼코마니입니다.', false),
    Question('Ordem은 수박을 싫어합니다.', false),
    Question('Ordem은 카폐에서 아메리카노만 먹습니다.', false),
    Question('Ordem은 공포영화를 싫어 합니다.', false),
    Question('Ordem은 발사이즈가 260입니다.', false),
    Question('Ordem은 대학교에서 2개의 동아리 활동을 했습니다.', false),
    Question('Ordem의 출생지는 김포입니다.', false),
    Question('Ordem은 게임 대회에서 우승한 적이 있습니다.', false),
    Question('Ordem은 TV에 나온적이 있습니다.', true),
    Question('Ordem은 차남입니다.', false),
    Question('Ordem이 배운 경험이 있는 악기는 피아노입니다.', true)
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
