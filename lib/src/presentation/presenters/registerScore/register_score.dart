import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_7_pay/src/data/models/address_model.dart';

import '../../../data/usecases/remote_adress.dart';
import 'dart:async';

part 'register_score.g.dart';

// ignore: library_private_types_in_public_api
class RegisterAdressStore = _RegisterAdressStore with _$RegisterAdressStore;

abstract class _RegisterAdressStore with Store {
  _RegisterAdressStore({
    List<AdressModel>? adressSave,
    List<AdressModel>? adressArguments,
  })  : adressSave = ObservableList<AdressModel>.of(adressSave ?? []),
        adressArguments = adressArguments ?? [],
        _remoteAdress = RemoteAdress() {
    _initializeAdressSave(adressSave);

    saveListAdress();
  }

  final RemoteAdress _remoteAdress;

  @observable
  List<AdressModel>? adressShared;

  @observable
  ObservableList<AdressModel> adressSave;

  @observable
  bool loading = false;

  @observable
  List<AdressModel>? adressArguments;

  @observable
  TextEditingController ufController = TextEditingController();
  @observable
  TextEditingController bairroController = TextEditingController();
  @observable
  TextEditingController logController = TextEditingController();

  // Adicione um StreamController para notificar sobre alterações na lista
  final _selectedAdressListController =
      StreamController<List<AdressModel>>.broadcast();

  // Getter para a stream
  Stream<List<AdressModel>> get selectedAdressListStream =>
      _selectedAdressListController.stream;

  @action
  void _initializeAdressSave(List<AdressModel>? initialAdressSave) {
    if (initialAdressSave != null && initialAdressSave.isNotEmpty) {
      adressSave.addAll(initialAdressSave);
    }
  }

  @action
  Future<void> getAdress() async {
    try {
      saveListAdress();
      loading = true;

      adressShared = await _remoteAdress.fetchAdress(
        ufController.value.text.toString(),
        bairroController.value.text.toString(),
        logController.value.text.toString(),
      );
    } catch (e) {
      throw Exception('Erro ao buscar endereço: $e');
    } finally {
      loading = false;
    }
  }

  @action
  void selectAdress(AdressModel selectedAdress) {
    if (adressSave.contains(selectedAdress)) {
      adressSave.remove(selectedAdress);
    } else {
      adressSave.add(selectedAdress);
    }

    // Emita o evento de mudança na lista
    _selectedAdressListController.add(adressSave.toList());
  }

  @action
  void saveListAdress() {
    if (adressArguments != null && adressArguments!.isNotEmpty) {
      adressSave.clear();
      adressSave.addAll(adressArguments!);

      // Emita o evento de mudança na lista
      _selectedAdressListController.add(adressSave.toList());
    }
  }

  // Adicione um método dispose para liberar recursos quando necessário
  void dispose() {
    _selectedAdressListController.close();
  }
}
