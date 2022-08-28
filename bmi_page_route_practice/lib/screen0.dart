import 'package:flutter/material.dart';

class Screen0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Screen 0'),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
                color: Colors.red,
                child: Text('Go To Screen1'),
                onPressed: () {
                  Navigator.pushNamed(context, '/first');
                }),
            RaisedButton(
                color: Colors.blue,
                child: Text('Go To Screen2'),
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                })
          ],
        ),
      ),
    );
  }
}
