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
  // Silver 6. 통화목록의 첫 번째 항목인 AUD로 기본 통화를 업데이트하기
  String selectedCurrency = 'AUD';

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
          // Silver 2. picker/dropdown을 변경할 때 getData 호출
          getData();
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
        // Silver 1. 선택한 통화를 selectedCurrency 속성에 저장
        selectedCurrency = currenciesList[selectedIndex];
        // Silver 2. picker/dropdown을 변경할 때 getData 호출
        getData();
      },
      children: pickerItems,
    );
  }

  // Gold 6. getData 메서드를 수정하여 crypto:price 값 쌍이 포함된 Map을 받도록 합니다. 그리고 Map을 사용하여 CryptoCard를 업데이트 함
  // bitcoinValue에서 coinValues로 변경
  // // Bronze 12. TextWidget에서 값을 유지하고 사용할 수 있는 변수를 만들고, 데이터가 비동기 메서드에 돌아오기 전에 변수에 '?'로 시작 값 지정
  // String bitcoinValue = '?';
  Map<String, String> coinValues = {};

  // Gold 7. price data가 오기 전 '?'를 표시하는 방법 구현하기 (hint : 3항 연산자)
  // Gold 7-1. 요청 완료를 기다리는 동안 추적할 변수를 만들어야 합니다.
  bool isWaiting = false;

  // Bronze 11. coin.dart로부터 coindata를 await하는 비동기 메서드 만들기
  void getData() async {
    // Gold 7-2. 가격 요청 시 true로 설정
    isWaiting = true;
    try {
      // Gold 6. getData 메서드를 수정하여 crypto:price 값 쌍이 포함된 Map을 받도록 하기 그리고 Map을 사용하여 CryptoCard를 업데이트 함
      var data = await CoinData().getCoinData(selectedCurrency);
      // Gold 7-3. 위 코드가 완료되면 기다리지 않아도 되므로 isWaiting을 false로 변경함
      isWaiting = false;
      // Bronze 13. setState()에서 await을 할 수 없기 때문에 두 단계로 분리
      setState(() {
        // // toStringAsFixed는 소수점 개수를 고정하는 함수
        // bitcoinValue = data.toStringAsFixed(0);
        coinValues = data;
        print("coinValues : $coinValues");
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    // Bronze 14. 화면에 로드되면 getData() 호출, coinData()를 호출할 수 없음, InitState()를 비동기화 할 수 없기 때문에 getCoinData()를 여기로 가져옴
    getData();
  }

  // // for loop challenge
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

  // // 안드로이드, IOS 플랫폼에 맞게 알아서 드롭다운을 가져옵니다.
  // Widget getPicker() {
  //   if (Platform.isIOS) {
  //     return iOSPicker();
  //   } else if (Platform.isAndroid) {
  //     return androidDropdown();
  //   } else {
  //     // The body might complete normally, causing 'null' to be returned, but the return type, 'Widget', is a potentially non-nullable type.
  //     // Try adding either a return or a throw statement at the end. 문제가 발생해서 else에 androidDropdown을 한번 더 추가했다.
  //     return androidDropdown();
  //   }
  // }
  // // 3항 연산을 통해 플랫폼 분류를 할 수 있다.

  // Gold bonus.  cryptoList를 반복하고 각 항목에 대해 CryptoCard를 생성하는 메서드를 작성

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
          // Gold 1. Padding위젯을 CryptoCard라는 별도의 stateless위젯으로 refactoring하여 각 암호화폐마다 3개씩 카드를 만들 수 있음
          // Gold 2. selectedCurrency, value, CryptoCurrency를 CryptoCard 위젯 생성자에게 전달해야 함
          // Gold 3. 3개의 CryptoCard포함하기 위해 Column위젯 사용하기
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CryptoCard(
                cryptoCurrency: 'BTC',
                // Gold 7-3. 3항연산자를 사용하여 대기 상태를 확인하고, 대기 상태는 ?, 완료 상태는 실제 가격 데이터를 표시
                value: isWaiting ? '?' : coinValues['BTC']!, // null-safety
                selectedCurrency: selectedCurrency,
              ),
              CryptoCard(
                cryptoCurrency: 'ETH',
                value: isWaiting ? '?' : coinValues['ETH']!,
                selectedCurrency: selectedCurrency,
              ),
              CryptoCard(
                cryptoCurrency: 'DOGE',
                value: isWaiting ? '?' : coinValues['DOGE']!,
                selectedCurrency: selectedCurrency,
              ),
            ],
          ),
          Container(
            height: 200.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            color: Colors.lightBlue,
            // 3항연산 사용한 플랫폼 분류
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}

// Gold 1. Padding위젯을 CryptoCard라는 별도의 stateless위젯으로 refactoring하여 각 암호화폐마다 3개씩 카드를 만들 수 있음
class CryptoCard extends StatelessWidget {
// Gold 2. selectedCurrency, value, CryptoCurrency를 CryptoCard 위젯 생성자에게 전달해야 함
  const CryptoCard({
    required this.value,
    required this.selectedCurrency,
    required this.cryptoCurrency,
  });

  final String value;
  final String selectedCurrency;
  final String cryptoCurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            // Silver 5. 통화를 선택하면 화면에 선택된 통화가 나오도록 하기
            '1 $cryptoCurrency = $value $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
