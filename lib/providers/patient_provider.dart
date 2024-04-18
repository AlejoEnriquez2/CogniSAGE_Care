import 'package:flutter/material.dart';
import 'package:frontend_form/services/secure_storage.dart';

class PatientProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  // GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // bool isValidForm() {
  //   return formKey.currentState?.validate() ?? false;
  // }

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
