import 'package:flutter/material.dart';

class UserFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  bool isChecked = false;
  bool? _error;
  bool? get error => _error;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set hasError(bool value) {
    _error = value;
    notifyListeners();
  }

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
