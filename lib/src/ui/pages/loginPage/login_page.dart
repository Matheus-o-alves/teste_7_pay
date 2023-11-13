// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../presentation/presenters/loginStore/login_store.dart';

class LoginPage extends StatelessWidget {
  final LoginStore _loginStore = LoginStore();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF393939),
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: const Color(0xFF393939),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/src/assets/logo-7pay.png',
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 20),
            Observer(
              builder: (_) => TextField(
                onChanged: _loginStore.setUsername,
                decoration: InputDecoration(
                  labelText: 'Nome de Usuário',
                  errorText: _loginStore.showUsernameError
                      ? 'Nome de usuário deve ter pelo menos 6 caracteres'
                      : null,
                  labelStyle: const TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Observer(
              builder: (_) => TextField(
                onChanged: _loginStore.setPassword,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  errorText: _loginStore.showPasswordError
                      ? 'Senha deve ter pelo menos 6 caracteres'
                      : null,
                  labelStyle: const TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                obscureText: true,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Observer(
              builder: (_) => ElevatedButton(
                onPressed: () => _loginStore.login(context),
                child: _loginStore.isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Entrar'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFFF08F21), // Cor do texto
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15.0), //
                ),
              ),
            ),
            Observer(
              builder: (_) => _loginStore.errorMessage.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _loginStore.errorMessage,
                        style: const TextStyle(color: Color(0xFFF08F21)),
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
