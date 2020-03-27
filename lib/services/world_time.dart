import 'package:http/http.dart';
import 'dart:convert';

class WorldCurrency{
  String country;
  double rate;

  WorldCurrency({this.country});

  Future<void> getRate() async{
    
    Response response = await get('https://api.exchangeratesapi.io/latest');
    Map data = jsonDecode(response.body);
    rate = data['rates']['$country'];
    
  }
}

