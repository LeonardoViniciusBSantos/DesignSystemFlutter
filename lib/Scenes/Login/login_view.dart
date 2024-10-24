import 'package:develop_design_system/DesignSystem/Components/Buttons/ActionButton/action_button_view_model.dart';
import 'package:develop_design_system/DesignSystem/Components/InputField/input_text_view_model.dart';
import 'package:develop_design_system/DesignSystem/Components/LinkedLabel/linked_label_view_model.dart';
import 'package:flutter/material.dart';
import 'package:develop_design_system/DesignSystem/Components/Buttons/ActionButton/action_button.dart';
import 'package:develop_design_system/DesignSystem/Components/InputField/input_text.dart';
import 'package:develop_design_system/DesignSystem/Components/LinkedLabel/linked_label.dart';
import 'package:develop_design_system/Scenes/Login/login_router.dart';
import 'package:develop_design_system/Scenes/Login/login_service.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginService loginService = LoginService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildLogo(),
            const SizedBox(height: 64),
            _buildEmailField(),
            const SizedBox(height: 16),
            _buildPasswordField(),
            const SizedBox(height: 24),
            _buildForgotPasswordLabel(),
            const SizedBox(height: 24),
            _buildLoginButton(context),
            const SizedBox(height: 96),
            _buildSignUpSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
      ),
      clipBehavior: Clip.hardEdge,
      child: Image.asset(
        'assets/148x148.png',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildEmailField() {
    return StyledInputField.instantiate(
      viewModel: InputTextViewModel(
        controller: emailController,
        placeholder: 'E-mail',
        password: false,
        validator: loginService.validateEmail,
      ),
    );
  }

  Widget _buildPasswordField() {
    return StyledInputField.instantiate(
      viewModel: InputTextViewModel(
        controller: passwordController,
        placeholder: 'Password',
        password: true,
        suffixIcon: const Icon(Icons.remove_red_eye),
        validator: loginService.validatePassword,
      ),
    );
  }

  Widget _buildForgotPasswordLabel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        LinkedLabel.instantiate(
          viewModel: LinkedLabelViewModel(
            fullText: 'Forgot Password',
            linkedText: 'Forgot Password',
            onLinkTap: () {
              print('Esqueceu a senha?');
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ActionButton.instantiate(
      viewModel: ActionButtonViewModel(
        style: ActionButtonStyle.primary,
        size: ActionButtonSize.large,
        text: 'Login',
        onPressed: () async {
          try {
            // Chama o método estático fetchLogin
            Map<String, dynamic> userData = await LoginService.fetchLogin(
              emailController.text,
              passwordController.text,
            );

            // Navega para a ProfilePage usando o LoginRouter e passa os dados do usuário
            LoginRouter.goToProfile(context);
          } catch (e) {
            //ERRO
          }
        },
      ),
    );
  }

  Widget _buildSignUpSection(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Don\'t Have An Account?',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: 73,
          child: ActionButton.instantiate(
            viewModel: ActionButtonViewModel(
              style: ActionButtonStyle.primary,
              size: ActionButtonSize.small,
              text: 'Sign Up',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginView()));
              },
            ),
          ),
        ),
      ],
    );
  }
}
