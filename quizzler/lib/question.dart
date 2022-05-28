// // Question 클래스를 만들었습니다.
// // 새로운 질문을 만들때 변수에 값을 주기 위해 생성자를 만들었습니다.
// // flutter 2.0 null safety로 인해서 변수의 초기화 없이 선언이 불가하다.
// // 임의의 값을 넣어서 초기화를 하고 선언했다.

// class Question {
//   String questionText = '';
//   bool questionAnswer = false;

//   Question(String q, bool a) {
//     questionText = q;
//     questionAnswer = a;
//   }
// }

class Question {
  String questionText = '';
  bool questionAnswer = false;

  Question(this.questionText, this.questionAnswer);
}
// // Class Constructors
// // DartPad 참조 
// // https://dartpad.dev/?id=6f6603ba5fa9e3b32cc3dddbcd555635


// // class 와 constructor 만들기
// // DartPad 참조
// // https://dartpad.dev/?id=e5f024d6064320bc6390c908bce8f7ae

// void main() {
//   Human jenny = Human(startingHeight: 15);
//   print(jenny.height);

//   Human james = Human(startingHeight: 20);
//   print(james.height);
  
//   jenny.talk('Why is the sky blue');  
// }

// class Human {
//   double height = 0.0;
//   int age = 0;

//   Human({double startingHeight = 0}) {
//     height = startingHeight;
//   }
  
//   void talk(String whatToSay){
//     print(whatToSay);
//   }
// }
