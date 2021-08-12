import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class LocFromPin extends ChangeNotifier {
  String _city = '';
  String _state = '';
  bool _loading = false;
  void getLocFromPin(String pinCode) async {
    _loading = true;
    notifyListeners();
    final response = await http
        .get(Uri.parse('https://api.postalpincode.in/pincode/$pinCode'));
    if (response.statusCode == 200 &&
        jsonDecode(response.body)[0]['Status'] != 'Error') {
      _state = jsonDecode(response.body)[0]['PostOffice'][0]['Circle'];
      notifyListeners();
      _city = jsonDecode(response.body)[0]['PostOffice'][0]['District'];
      notifyListeners();
      _loading = false;
      notifyListeners();
    } else {
      _city = '';
      notifyListeners();
      _state = '';
      notifyListeners();
      _loading = false;
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

  bool get loading {
    return _loading;
  }
}
