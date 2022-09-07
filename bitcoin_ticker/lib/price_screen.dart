import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';

  // DropdownMenuButton
  List<DropdownMenuItem<String>> getDropdownItems() {
    // coin_data.dart에 있는 currenciesList에서 가져온 목록들을 저장하기 위해 변수를 만들었다.
    List<DropdownMenuItem<String>> dropdownItems = [];
    // currencies.length는 coin_data.dart에 있는 currenciesList가 가지고 있는 목록 개수를 의미한다.
    for (int i = 0; i < currenciesList.length; i++) {
      String currency = currenciesList[i];
      // 드롭다운 메뉴 아이템을 커스텀 하기 위해 새 변수를 선언했다.
      // 드롭다운 메뉴 아이템에 들어갈 항목들은 coin_data.dart에 있는 currenciesList가 가지고 있는 목록이다.
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      // newItem 드롭다운에 가져온 목록들을 하나씩 저장한다.
      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }

  // // for statement challenge
  // List<DropdownMenuItem<String>> androidDropdown() {
  //   List<DropdownMenuItem<String>> dropdownItems = [];
  //   for (String currency in currenciesList) {
  // // for 문 조건 :  currentciesList가 가지고 있는 목록 전부
  //     var newItem = DropdownMenuItem(
  //       child: Text(currency),
  //       value: currency,
  //     );
  //     dropdownItems.add(newItem);
  //   }
  //   return dropdownItems;
  // }

  // // CupertinoPicker method
  // List<Text> getPickerItems() {
  //   List<Text> pickerItems = [];
  //   for (String currency in currenciesList) {
  //     Text(currency);
  //     pickerItems.add(Text(currency));
  //   }
  //   return pickerItems;
  // }

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

            // Android DropdownButton
            child: DropdownButton<String>(
              // items 프로퍼티 또는 onChanged 프로퍼티가 null이라면 드롭 다운 버튼이 비활성화 된다.
              // 드롭다운 버튼 위젯에서 value 프로퍼티를 쓰면 앱을 실행했을때 기본 값을 지정할 수 있지만 다른 값으로 바꿀 수 없다.
              // 다른 값으로 바꾸려면 변수를 만들어서 상태 변화시 값을 넘겨주면 된다.
              value: selectedCurrency,
              items: getDropdownItems(),
              // onChanged에서 위 메뉴들이 가지고 있는 value를 보낸다.
              onChanged: (value) {
                setState(() {
                  selectedCurrency = value!;
                });
              },
            ),

            //
            // IOS 스타일의 드롭다운 버튼이다.
            // child: CupertinoPicker(
            //   itemExtent: 32.0,
            //   onSelectedItemChanged: (selectedIndex) {
            //     print(selectedIndex);
            //   },
            //   children: getPickerItems(),
            // ),
            //
            //
          ),
        ],
      ),
    );
  }
}
