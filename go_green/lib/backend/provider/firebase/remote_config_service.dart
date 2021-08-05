import 'package:flutter/cupertino.dart';

class ServerConfig extends ChangeNotifier {
  late String _api;
  late String _ip;

  void setData(api, ip) {
    _api = api;
    notifyListeners();
    _ip = ip;
    notifyListeners();
  }

  String get apiKey {
    return _api;
  }

  String get ip {
    return _ip;
  }
}
