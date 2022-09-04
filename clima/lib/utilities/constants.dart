import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 40.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kCityNmaeTextStyle = TextStyle(
  fontFamily: 'spartan MB',
  fontSize: 40.0,
);

const kTextFieldInputDecoration = InputDecoration(
  // TextFormField의 배경색 유무
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  // placeholder
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    // 모서리 깎기
    borderRadius: BorderRadius.all(
      Radius.circular(
        10.0,
      ),
    ),
    // TextFormField 테두리 제거
    borderSide: BorderSide.none,
  ),
);
