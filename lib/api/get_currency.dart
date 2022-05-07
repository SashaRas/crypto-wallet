import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Currency extends ChangeNotifier{
  Future<double> getCryptoCurrency(String cryptoName) async {
  try {
    final url = Uri.parse('ttps://api.coingecko.com/api/v3/coins/$cryptoName');
    final response = await http.get(url);
    final json = jsonDecode(response.body);
    final String value = json['market_data']['current_price']['usd'].toString();
    return double.parse(value);
  } catch (e) {
    print(e);
    return 0.00000;
  }
}
}