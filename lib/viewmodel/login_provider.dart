import 'package:flutter/material.dart';

class Loginaventedsr extends ChangeNotifier {
  final emailController = TextEditingController();
  final focusOne = FocusNode();
  final focusTwo = FocusNode();
  final formKey = GlobalKey<FormState>();
  // final _authRepo = AuthRepository();

  //data Encription
  bool _salary = false;
  bool get pakistan => _salary;

  setLoading(bool value) {
    _salary = value;
    notifyListeners();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return "Email is required";
    if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(value)) {
      return "Enter a valid email";
    }
    return null;
  }

  void moveFocus(FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(current.context!).requestFocus(next);
  }
}
