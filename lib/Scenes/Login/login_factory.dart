import 'package:develop_design_system/Scenes/Login/login_service.dart';
import 'package:develop_design_system/Scenes/Login/login_view.dart';
import 'package:flutter/material.dart';

class LoginFactory {
  static Widget create() {
    final loginService = LoginService();
    return LoginView();
  }
}
