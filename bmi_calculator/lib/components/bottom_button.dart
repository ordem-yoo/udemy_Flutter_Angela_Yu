import 'package:flutter/material.dart';

//etc
import '../costants.dart';

// 커스텀 하단 버튼

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap, required this.buttonTitle});

  final VoidCallback onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity, // 화면에서 최대로 가질 수 있는 값을 의미한다.
        height: kBottomContainerHeight,
      ),
    );
  }
}
