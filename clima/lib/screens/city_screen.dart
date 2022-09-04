import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    // 아무 변화 없이 이전 화면으로 돌아가고 싶으면 Navigator.pop(context)라고 하면 된다.
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                // TextFormField는 인터넷에서 검색창처럼 텍스트를 입력할 수 있는 위젯이다.
                child: TextFormField(
                  // 입력 글자 스타일
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  // TextFormField에 들어가는 decoration 프로퍼티를 변수로 만들었다.
                  decoration: kTextFieldInputDecoration,
                  // onTap, onPressed처럼 화면이 변화에 따라 수행하는 콜백함수가 있듯이
                  // onChanged는 입력할 때마다, 지울 때마다 수행한다.
                  // 콘솔에서 입력하고, 지울 때마다 표시된다.
                  onChanged: (value) {
                    // print(value);
                    cityName = value;
                  },
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
