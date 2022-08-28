import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Screen 2'),
      ),
      body: Center(
          child: RaisedButton(
        color: Colors.blue,
        child: Text('Go Back To Screen 1'),
        onPressed: () {
          // 화면을 하나씩 뺀다고 생각하면 된다.
          Navigator.pop(context);
        },
      )),
    );
  }
}
