import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

import '../../../data/models/address_model.dart';
import '../../../data/usecases/remote_adress.dart';
import '../../../ui/pages/adressPage/adress_page.dart';
import '../../../ui/pages/adressRegistrationPage/adress_register_page.dart';

part 'adress_score.g.dart';

class AdressStore = _AdressStore with _$AdressStore;

abstract class _AdressStore with Store {
  _AdressStore(
      {List<AdressModel>? adressSave, List<AdressModel>? adressArguments})
      : adressSave = adressSave ?? [],
        adressArguments = adressArguments ?? [],
        _remoteAdress = RemoteAdress() {
    _initializeAdressSave(adressSave);
  }

  final RemoteAdress _remoteAdress;

  @observable
  List<AdressModel>? adressShared;
  @observable
  List<AdressModel>? adressSave;
  @observable
  List<AdressModel>? adressArguments;

  @observable
  bool loading = false;

  @observable
  TextEditingController ufController = TextEditingController();
  @observable
  TextEditingController bairroController = TextEditingController();
  @observable
  TextEditingController logController = TextEditingController();

  @action
  void _initializeAdressSave(List<AdressModel>? initialAdressSave) {
    if (initialAdressSave != null && initialAdressSave.isNotEmpty) {
      adressSave = initialAdressSave;
    }
  }

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
    // Certifique-se de inicializar a lista se ainda não estiver
    adressSave ??= [];

    // Adiciona o endereço selecionado ao adressSave
    adressSave!.add(selectedAdress);
  }

  // @action
  // void navigateToExpenseDetails() {
  //   Get.to(() => RegisterAdressPage());
  // }
}
