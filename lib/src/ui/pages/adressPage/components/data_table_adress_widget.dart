import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_7_pay/src/data/models/address_model.dart';

Widget buildDataTable(List<AdressModel>? adress, BuildContext context) {
  if (adress != null && adress.isNotEmpty) {
    return Observer(builder: (context) {
      return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black), // Adiciona a borda preta
          borderRadius: BorderRadius.circular(
              10.0), // Opcional: adiciona bordas arredondadas
        ),
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Cep')),
            DataColumn(label: Text('Logradouro')),
            DataColumn(label: Text('Complemento')),
            DataColumn(label: Text('Bairro')),
            DataColumn(label: Text('Localidade')),
            DataColumn(label: Text('Uf')),
            DataColumn(label: Text('Ibge')),
            // Nova coluna para indicar se o endereço foi selecionado
          ],
          rows: adress.map((item) {
            return DataRow(cells: [
              DataCell(Text(item.cep)),
              DataCell(Text(item.logradouro)),
              DataCell(Text(item.complemento)),
              DataCell(Text(item.bairro)),
              DataCell(Text(item.localidade)),
              DataCell(Text(item.uf)),
              DataCell(Text(item.ibge)),
            ]);
          }).toList(),
        ),
      );
    });
  } else {
    try {
      return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Cep')),
            DataColumn(label: Text('Logradouro')),
            DataColumn(label: Text('Complemento')),
            DataColumn(label: Text('Bairro')),
            DataColumn(label: Text('Localidade')),
            DataColumn(label: Text('Uf')),
            DataColumn(label: Text('Ibge')), // Adicione pelo menos uma coluna
          ],
          rows: const [
            DataRow(cells: [
              DataCell(
                Text(""),
              ),
              DataCell(
                Text(""),
              ),
              DataCell(
                Text(""),
              ),
              DataCell(
                Text(""),
              ),
              DataCell(
                Text(""),
              ),
              DataCell(
                Text(""),
              ),
              DataCell(
                Text(""),
              )
            ])
          ],
        ),
      );
    } catch (e) {
      return const Text('Error occurred (empty table)');
    }
  }
}
