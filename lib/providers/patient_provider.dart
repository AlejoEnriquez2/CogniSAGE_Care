import 'package:flutter/material.dart';
import 'package:frontend_form/services/secure_storage.dart';

class PatientProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  bool get isLoogedIn => _isLoggedIn;

  void login(String token) {
    if (token.isNotEmpty) {
      _isLoggedIn = true;
      notifyListeners();
    }
  }

  void logout() {
    _isLoggedIn = false;
    SecureStorage().deleteToken();
    notifyListeners();
  }
}
