import 'package:develop_design_system/Scenes/Login/login_view.dart';
import 'package:develop_design_system/Scenes/Signup/signup_service.dart';
import 'package:flutter/material.dart';
import 'package:develop_design_system/DesignSystem/Components/Buttons/ActionButton/action_button.dart';
import 'package:develop_design_system/DesignSystem/Components/Buttons/ActionButton/action_button_view_model.dart';
import 'package:develop_design_system/DesignSystem/Components/InputField/input_text.dart';
import 'package:develop_design_system/DesignSystem/Components/InputField/input_text_view_model.dart';
import 'package:develop_design_system/DesignSystem/Components/LinkedLabel/linked_label.dart';
import 'package:develop_design_system/DesignSystem/Components/LinkedLabel/linked_label_view_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool acceptedTerms = false;
  final signUpService = SignUpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/148x148.png', height: 148),
            const SizedBox(height: 64),
            StyledInputField.instantiate(
              viewModel: InputTextViewModel(
                controller: emailController,
                placeholder: 'E-mail',
                validator: (value) =>
                    value!.isEmpty ? 'Esse campo é obrigatório' : null,
                password: false,
              ),
            ),
            const SizedBox(height: 16),
            StyledInputField.instantiate(
              viewModel: InputTextViewModel(
                controller: passwordController,
                placeholder: 'Password',
                password: true,
                validator: (value) =>
                    value!.length < 6 ? 'Senha deve ter 6+ caracteres' : null,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: acceptedTerms,
                  onChanged: (value) => setState(() => acceptedTerms = value!),
                ),
                LinkedLabel.instantiate(
                  viewModel: LinkedLabelViewModel(
                    fullText: 'I agree with Terms & Services',
                    linkedText: 'Terms & Services',
                    onLinkTap: () => print('Terms tapped'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ActionButton.instantiate(
              viewModel: ActionButtonViewModel(
                text: 'Sign Up',
                onPressed: () {
                  signUpService.signUp(
                    emailController.text,
                    passwordController.text,
                    acceptedTerms,
                  );
                },
                size: ActionButtonSize.large,
                style: ActionButtonStyle.primary,
              ),
            ),
            const SizedBox(height: 96),
            const Text('Already Have An Account?'),
            ActionButton.instantiate(
              viewModel: ActionButtonViewModel(
                text: 'Login',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginView()));
                },
                size: ActionButtonSize.large,
                style: ActionButtonStyle.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
