import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
              // items 프로퍼티 또는 onChanged 프로퍼티가 null이라면 드롭 다운 버튼이 비활성화 된다.
              // 드롭다운 버튼 위젯에서 value 프로퍼티를 쓰면 앱을 실행했을때 기본 값을 지정할 수 있지만 다른 값으로 바꿀 수 없다.
              // 다른 값으로 바꾸려면 변수를 만들어서 상태 변화시 값을 넘겨주면 된다.
              value: selectedCurrency,
              items: [
                DropdownMenuItem(
                  child: Text('USD'),
                  value: 'USD',
                ),
                DropdownMenuItem(
                  child: Text('EUR'),
                  value: 'EUR',
                ),
                DropdownMenuItem(
                  child: Text('KRW'),
                  value: 'KRW',
                ),
              ],
              // onChanged에서 위 메뉴들이 가지고 있는 value를 보낸다.
              onChanged: (value) {
                setState(() {
                  selectedCurrency = value!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
