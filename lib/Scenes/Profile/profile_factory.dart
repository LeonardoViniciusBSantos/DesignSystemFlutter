import 'package:flutter/material.dart';
import 'profile_service.dart';
import 'profile_view.dart';

class ProfileFactory {
  static Widget create() {
    final profileService = ProfileService();
    return ProfileView();
  }
}
