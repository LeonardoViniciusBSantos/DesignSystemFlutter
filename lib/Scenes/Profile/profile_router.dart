import 'package:flutter/material.dart';
import '../Login/login_view.dart';

class ProfileRouter {
  static void navigateToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginView()),
    );
  }
}
