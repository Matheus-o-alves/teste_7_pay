import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_7_pay/src/data/models/address_model.dart';
import 'package:teste_7_pay/src/ui/pages/adressPage/adress_page.dart';

import '../../../data/usecases/remote_adress.dart';

part 'register_score.g.dart';

class RegisterAdressStore = _RegisterAdressStore with _$RegisterAdressStore;

abstract class _RegisterAdressStore with Store {
  final RemoteAdress _remoteAdress = RemoteAdress();

  @observable
  List<AdressModel>? adressShared;
  @observable
  List<AdressModel>? adressSave = [];

  @observable
  bool loading = false;

  @observable
  TextEditingController ufController = TextEditingController();
  @observable
  TextEditingController bairroController = TextEditingController();
  @observable
  TextEditingController logController = TextEditingController();

  @action
  Future<void> getAdress() async {
    try {
      loading = true;

      adressShared = await _remoteAdress.fetchAdress(
          ufController.value.text.toString(),
          bairroController.value.text.toString(),
          logController.value.text.toString());
    } catch (e) {
      print('Erro ao buscar endereço: $e');
      throw Exception('Erro ao buscar endereço: $e');
    } finally {
      loading = false;
    }
  }

  @action
  void selectAdress(AdressModel selectedAdress) {
    // Adiciona o endereço selecionado ao adressSave
    adressSave!.add(selectedAdress);
  }

  @action
  void navigateToExpenseDetails() {
    Get.to(() => AdressPage(
          adressArguments: adressSave,
        ));
  }
}
