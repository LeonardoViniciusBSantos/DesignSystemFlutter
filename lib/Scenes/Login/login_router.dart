import 'package:develop_design_system/Scenes/Profile/profile_view.dart';
import 'package:develop_design_system/Scenes/Signup/signup_view.dart';
import 'package:flutter/material.dart';

class LoginRouter {
  static void goToProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfileView()),
    );
  }

  static void goToSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpView()),
    );
  }
}
