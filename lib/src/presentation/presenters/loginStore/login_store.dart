import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_7_pay/src/ui/pages/adressPage/adress_page.dart';
part 'login_store.g.dart';

// ignore: library_private_types_in_public_api
class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String username = '';

  @observable
  String password = '';

  @observable
  bool isLoading = false;

  @observable
  bool showUsernameError = false;

  @observable
  bool showPasswordError = false;

  @observable
  String errorMessage = '';

  @computed
  bool get isUsernameValid => username.length >= 6;

  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  bool get isFormValid => isUsernameValid && isPasswordValid;

  @action
  void setUsername(String value) {
    username = value;
    if (showUsernameError) {
      showUsernameError = false;
    }
  }

  @action
  void setPassword(String value) {
    password = value;
    if (showPasswordError) {
      showPasswordError = false;
    }
  }

  @action
  Future<void> login(BuildContext context) async {
    try {
      isLoading = true;

      await Future.delayed(const Duration(seconds: 2));

      errorMessage = '';

      if (isFormValid) {
        Get.to(() => const AdressPage());
      }
    } catch (e) {
      errorMessage = 'Erro ao fazer login: $e';
    } finally {
      isLoading = false;

      showUsernameError = !isUsernameValid;
      showPasswordError = !isPasswordValid;

      if (!isFormValid) {
        errorMessage = 'Campos inválidos. Verifique as condições.';
      }
    }
  }
}
