import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserDataProvider extends ChangeNotifier {
  UserModel? userData;

  void setUser(UserModel data) {
    userData = data;
    notifyListeners();
  }

  void clearUserData() {
    userData = null;
    notifyListeners();
  }
}

