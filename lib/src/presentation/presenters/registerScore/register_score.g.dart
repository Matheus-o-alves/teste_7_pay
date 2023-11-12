// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_score.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterAdressStore on _RegisterAdressStore, Store {
  late final _$adressSharedAtom =
      Atom(name: '_RegisterAdressStore.adressShared', context: context);

  @override
  List<AdressModel>? get adressShared {
    _$adressSharedAtom.reportRead();
    return super.adressShared;
  }

  @override
  set adressShared(List<AdressModel>? value) {
    _$adressSharedAtom.reportWrite(value, super.adressShared, () {
      super.adressShared = value;
    });
  }

  late final _$adressSaveAtom =
      Atom(name: '_RegisterAdressStore.adressSave', context: context);

  @override
  List<AdressModel>? get adressSave {
    _$adressSaveAtom.reportRead();
    return super.adressSave;
  }

  @override
  set adressSave(List<AdressModel>? value) {
    _$adressSaveAtom.reportWrite(value, super.adressSave, () {
      super.adressSave = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_RegisterAdressStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$ufControllerAtom =
      Atom(name: '_RegisterAdressStore.ufController', context: context);

  @override
  TextEditingController get ufController {
    _$ufControllerAtom.reportRead();
    return super.ufController;
  }

  @override
  set ufController(TextEditingController value) {
    _$ufControllerAtom.reportWrite(value, super.ufController, () {
      super.ufController = value;
    });
  }

  late final _$bairroControllerAtom =
      Atom(name: '_RegisterAdressStore.bairroController', context: context);

  @override
  TextEditingController get bairroController {
    _$bairroControllerAtom.reportRead();
    return super.bairroController;
  }

  @override
  set bairroController(TextEditingController value) {
    _$bairroControllerAtom.reportWrite(value, super.bairroController, () {
      super.bairroController = value;
    });
  }

  late final _$logControllerAtom =
      Atom(name: '_RegisterAdressStore.logController', context: context);

  @override
  TextEditingController get logController {
    _$logControllerAtom.reportRead();
    return super.logController;
  }

  @override
  set logController(TextEditingController value) {
    _$logControllerAtom.reportWrite(value, super.logController, () {
      super.logController = value;
    });
  }

  late final _$getAdressAsyncAction =
      AsyncAction('_RegisterAdressStore.getAdress', context: context);

  @override
  Future<void> getAdress() {
    return _$getAdressAsyncAction.run(() => super.getAdress());
  }

  late final _$_RegisterAdressStoreActionController =
      ActionController(name: '_RegisterAdressStore', context: context);

  @override
  void selectAdress(AdressModel selectedAdress) {
    final _$actionInfo = _$_RegisterAdressStoreActionController.startAction(
        name: '_RegisterAdressStore.selectAdress');
    try {
      return super.selectAdress(selectedAdress);
    } finally {
      _$_RegisterAdressStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void navigateToExpenseDetails() {
    final _$actionInfo = _$_RegisterAdressStoreActionController.startAction(
        name: '_RegisterAdressStore.navigateToExpenseDetails');
    try {
      return super.navigateToExpenseDetails();
    } finally {
      _$_RegisterAdressStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
adressShared: ${adressShared},
adressSave: ${adressSave},
loading: ${loading},
ufController: ${ufController},
bairroController: ${bairroController},
logController: ${logController}
    ''';
  }
}
