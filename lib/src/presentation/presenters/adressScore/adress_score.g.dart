// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adress_score.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AdressStore on _AdressStore, Store {
  late final _$adressSharedAtom =
      Atom(name: '_AdressStore.adressShared', context: context);

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
      Atom(name: '_AdressStore.adressSave', context: context);

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

  late final _$adressArgumentsAtom =
      Atom(name: '_AdressStore.adressArguments', context: context);

  @override
  List<AdressModel>? get adressArguments {
    _$adressArgumentsAtom.reportRead();
    return super.adressArguments;
  }

  @override
  set adressArguments(List<AdressModel>? value) {
    _$adressArgumentsAtom.reportWrite(value, super.adressArguments, () {
      super.adressArguments = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_AdressStore.loading', context: context);

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
      Atom(name: '_AdressStore.ufController', context: context);

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
      Atom(name: '_AdressStore.bairroController', context: context);

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
      Atom(name: '_AdressStore.logController', context: context);

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
      AsyncAction('_AdressStore.getAdress', context: context);

  @override
  Future<void> getAdress() {
    return _$getAdressAsyncAction.run(() => super.getAdress());
  }

  late final _$_AdressStoreActionController =
      ActionController(name: '_AdressStore', context: context);

  @override
  void _initializeAdressSave(List<AdressModel>? initialAdressSave) {
    final _$actionInfo = _$_AdressStoreActionController.startAction(
        name: '_AdressStore._initializeAdressSave');
    try {
      return super._initializeAdressSave(initialAdressSave);
    } finally {
      _$_AdressStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectAdress(AdressModel selectedAdress) {
    final _$actionInfo = _$_AdressStoreActionController.startAction(
        name: '_AdressStore.selectAdress');
    try {
      return super.selectAdress(selectedAdress);
    } finally {
      _$_AdressStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
adressShared: ${adressShared},
adressSave: ${adressSave},
adressArguments: ${adressArguments},
loading: ${loading},
ufController: ${ufController},
bairroController: ${bairroController},
logController: ${logController}
    ''';
  }
}
