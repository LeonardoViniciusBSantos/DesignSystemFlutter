import 'package:develop_design_system/Scenes/Profile/profile_view.dart';
import 'package:flutter/material.dart';

class SignupRouter {
  static void navigateToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfileView()),
    );
  }
}
