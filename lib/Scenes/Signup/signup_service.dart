class SignUpService {
  void signUp(String email, String password, bool acceptedTerms) {
    if (!acceptedTerms) {
      print('Aceite os termos para continuar.');
      return;
    }

    if (email.isEmpty || password.isEmpty) {
      print('Campos não podem estar vazios.');
      return;
    }

    // Implementação de lógica adicional (API, banco de dados, etc.)
    print('Usuário cadastrado com sucesso!');
  }
}
