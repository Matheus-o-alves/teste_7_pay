import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_7_pay/src/data/models/address_model.dart';

import '../../../../presentation/presenters/adressScore/adress_score.dart';

Widget buildDataTable(List<AdressModel>? adress) {
  final AdressStore _adressStore = AdressStore();

  if (adress != null && adress.isNotEmpty) {
    return Observer(builder: (context) {
      return DataTable(
        columns: [
          DataColumn(label: Text('Cep')),
          DataColumn(label: Text('Logradouro')),
          DataColumn(label: Text('Complemento')),
          DataColumn(label: Text('Bairro')),
          DataColumn(label: Text('Localidade')),
          DataColumn(label: Text('Uf')),
          DataColumn(label: Text('Ibge')),
          DataColumn(label: Text('Opções')),
          DataColumn(
              label: Text(
                  'Selecionado')), // Nova coluna para indicar se o endereço foi selecionado
        ],
        rows: adress.map((item) {
          bool isSelected = _adressStore.adressSave?.contains(item) ?? false;

          return DataRow(cells: [
            DataCell(Text(item.cep)),
            DataCell(Text(item.logradouro)),
            DataCell(Text(item.complemento)),
            DataCell(Text(item.bairro)),
            DataCell(Text(item.localidade)),
            DataCell(Text(item.uf)),
            DataCell(Text(item.ibge)),
            DataCell(
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  _adressStore.selectAdress(item);
                },
              ),
            ),
            DataCell(isSelected
                ? IconButton(
                    icon: Icon(Icons.check_circle, color: Colors.green),
                    onPressed: () {
                      _adressStore.selectAdress(item);
                    },
                  )
                : IconButton(
                    icon: Icon(Icons.check_circle, color: Colors.grey),
                    onPressed: () {
                      _adressStore.selectAdress(item);
                    },
                  )),
          ]);
        }).toList(),
      );
    });
  } else {
    return Text('Nenhum endereço encontrado.');
  }
}
