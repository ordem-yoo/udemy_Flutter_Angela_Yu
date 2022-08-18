import 'package:flutter/material.dart';

//etc
import '../costants.dart';

// 커스텀 floatingActionButton 만들기

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback
      onPressed; // 강의에서는 Function으로 했지만 null safety의 문제로 VoidCallback으로 바꿔야 한다.
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 0.0,
      disabledElevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
