// Packages
import 'package:flutter/material.dart';
// Screens
import 'Screens/chat_Screen.dart';
import 'Screens/home_Screen.dart';
import 'Screens/loginScreen.dart';
import 'Screens/registration_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // 멀티 페이지 이동
      // cf. https://docs.flutter.dev/cookbook/navigation/named-routes
      initialRoute: HomeScreen.id,
      // 처음 나오는 화면의 라우트를 호출한다.
      // routes
      routes: {
        // routes는 이동할 화면들의 이름을 정하는 프로퍼티이다.
        HomeScreen.id: (context) => HomeScreen(),
        // 'Home': (context) => LoginScreen(),
        // "Home" 경로로 이동할 때  위젯을 빌드한다.
        LoginScreen.id: (context) => LoginScreen(),
        // 'Login': (context) => LoginScreen(),
        // "Login" 경로로 이동할 때  위젯을 빌드한다.
        RegisterScreen.id: (context) => RegisterScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
