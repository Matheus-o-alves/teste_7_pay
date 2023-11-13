import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../data/models/address_model.dart';

part 'address_store.g.dart';

// ignore: library_private_types_in_public_api
class AdressStore = _AdressStore with _$AdressStore;

abstract class _AdressStore with Store {
  _AdressStore(
      {List<AdressModel>? adressSave, List<AdressModel>? adressArguments})
      : adressSave = adressSave ?? [],
        adressArguments = adressArguments ?? [] {
    _initializeAdressSave(adressSave);
  }

  @observable
  List<AdressModel>? adressShared;
  @observable
  List<AdressModel>? adressSave;
  @observable
  List<AdressModel>? adressArguments;

  @observable
  List<AdressModel>? filteredAdress;

  @observable
  bool loading = false;

  @observable
  String? errorMessage;

  @observable
  TextEditingController ufController = TextEditingController();
  @observable
  TextEditingController bairroController = TextEditingController();

  @action
  void _initializeAdressSave(List<AdressModel>? initialAdressSave) {
    if (initialAdressSave != null && initialAdressSave.isNotEmpty) {
      adressSave = initialAdressSave;
    }
  }

  @action
  void filterAdress() {
    errorMessage = null;

    if (adressArguments != null) {
      filteredAdress = adressArguments!
          .where((address) =>
              address.bairro.toUpperCase() ==
                  bairroController.text.toUpperCase() &&
              address.uf.toUpperCase() == ufController.text.toUpperCase())
          .toList();
    }
  }
}
