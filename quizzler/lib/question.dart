// Question 클래스를 만들었습니다.
// 새로운 질문을 만들때 변수에 값을 주기 위해 생성자를 만들었습니다.

class Question {
  late String questionText;
  late bool questionAnswer;

  Question(String q, bool a) {
    questionText = q;
    questionAnswer = a;
  }
}
