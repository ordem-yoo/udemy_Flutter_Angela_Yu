import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
// 플랫폼 관련 라이브러리
// 라이브러리 뒤에 show 키워드를 쓰면 show 뒤에 오는 클래스만 가져올 수 있다.
// 반대로 hide 키워드를 쓰면 hide 뒤에 오는 클래스는 제외하고 가져온다.
// 많은 라이브러리를 사용하게 되면 클래스 이름이 중복되는 경우도 있다.
// as 키워드를 사용해 네임스페이스를 지정해 줄 수 있다.
// ex) import 'dart:io' as ordem_io;
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';

  // refactoring dropdownbutton
  // 이전 커밋 확인해 볼 것
  DropdownButton<String> androidDropdown() {
    // refactoring 하기 위해 목록을 불러오는 getDropdownItems 메서드 안에 있는 코드를 가져왔다.

    // used to be getDropdownButton method
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

    //  // Android DropdownButton
    //         child: DropdownButton<String>(
    //           // items 프로퍼티 또는 onChanged 프로퍼티가 null이라면 드롭 다운 버튼이 비활성화 된다.
    //           // 드롭다운 버튼 위젯에서 value 프로퍼티를 쓰면 앱을 실행했을때 기본 값을 지정할 수 있지만 다른 값으로 바꿀 수 없다.
    //           // 다른 값으로 바꾸려면 변수를 만들어서 상태 변화시 값을 넘겨주면 된다.
    //           value: selectedCurrency,
    //           items: getDropdownButton(),
    //           // onChanged에서 위 메뉴들이 가지고 있는 value를 보낸다.
    //           onChanged: (value) {
    //             setState(() {
    //               selectedCurrency = value!;
    //             });
    //           },
    //         ),

    // used to be getDropdownButton method

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value!;
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    // CupertinoPicker method

    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }
    return CupertinoPicker(
      // android와 다르게 베경색이 default가 회색이기 때문에 배경색을 지정해 줘야한다.
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: pickerItems,
    );
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

  // 안드로이드, IOS 플랫폼에 맞게 알아서 드롭다운을 가져옵니다.
  Widget getPicker() {
    if (Platform.isIOS) {
      return iOSPicker();
    } else if (Platform.isAndroid) {
      return androidDropdown();
    } else {
      // The body might complete normally, causing 'null' to be returned, but the return type, 'Widget', is a potentially non-nullable type.
      // Try adding either a return or a throw statement at the end. 문제가 발생해서 else에 androidDropdown을 한번 더 추가했다.
      return androidDropdown();
    }
  }
  // 3항 연산을 통해 플랫폼 분류를 할 수 있다.

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
            // 3항연산 사용한 플랫폼 분류
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}
