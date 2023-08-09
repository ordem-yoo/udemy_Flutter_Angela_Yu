// Bronze 2. http 패키지 import 작성
import 'package:http/http.dart';
// Bronze 7-1. 'dart:convert' 패키지 import 작성
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'KRW',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
  'DOGE',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apikey = 'CB26E771-4D89-44FA-98A9-FF1DC38D616E';

class CoinData {
  // Silver 3. getCoinData를 업데이트하기 위해 selectcurrency를 함수 인자로 사용하기
  // Bronze 3. Future를 반환하는 비동기 메서드 getCoinDate() 만들기
  Future getCoinData(String selectedCurrency) async {
    // Silver 4. 선택한 통화 입력을 사용하기 위해 URL 업데이트
    // Bronze 4. 관심있는 코인을 coinAPIURL과 결합하기
    String requestURL = '$coinAPIURL/BTC/$selectedCurrency?apikey=$apikey';
    // Bronze 5. URL에 GET 요청을 하고 response 대기
    Response response = await get(Uri.parse(requestURL));
    // Bronze 6. 요청이 되었는지 확인
    if (response.statusCode == 200) {
      // Bronze 7-2. 'dart:convert' 패키지를 사용해서 coinAPI.io에서 가져온 JSON 데이터를 decode
      var decodeData = jsonDecode(response.body);
      // Bronze 8. 'last' 키로 bitcoin의 마지막 가격을 가져오기
      var lastPrice = decodeData['rate'];
      // Bronze 9. 메서드에서 마지막 가격 출력
      return lastPrice;
    } else {
      // Bronze 10. 요청 중 발생한 오류 처리
      print(response.statusCode);
      // Bronze Optional: 요청 실패 시 오류 발생
      throw 'Problem with the get request';
    }
  }
}
