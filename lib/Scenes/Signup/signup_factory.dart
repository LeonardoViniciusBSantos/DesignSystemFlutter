import 'signup_service.dart';
import 'signup_view.dart';

class SignUpFactory {
  static SignUpView create() {
    final signUpService = SignUpService();
    return SignUpView();
  }
}
