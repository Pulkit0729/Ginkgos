import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class LocFromPin extends ChangeNotifier {
  String _city = '';
  String _state = '';

  void getLocFromPin(String pinCode) async {
    final response = await http
        .get(Uri.parse('https://api.postalpincode.in/pincode/$pinCode'));
    print('It worker');
    print(response.statusCode);
    if (response.statusCode == 200) {
      _state = jsonDecode(response.body)[0]['PostOffice'][0]['Circle'];
      notifyListeners();
      _city = jsonDecode(response.body)[0]['PostOffice'][0]['District'];
      notifyListeners();
    } else {
      _city = '';
      notifyListeners();
      _state = '';
      notifyListeners();
    }
  }

  void reset() {
    _city = '';
    notifyListeners();
    _state = '';
    notifyListeners();
  }

  String get city {
    return _city;
  }

  String get state {
    return _state;
  }
}
