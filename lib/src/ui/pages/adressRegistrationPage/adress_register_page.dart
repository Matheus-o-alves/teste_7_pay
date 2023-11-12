import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:teste_7_pay/src/ui/pages/adressPage/adress_page.dart';

import '../../../data/models/address_model.dart';
import '../../../presentation/presenters/adressScore/adress_score.dart';
import '../../../presentation/presenters/registerScore/register_score.dart';

class RegisterAdressPage extends StatelessWidget {
  final List<AdressModel>? registerAdressArguments;

  const RegisterAdressPage({super.key, this.registerAdressArguments});

  @override
  Widget build(BuildContext context) {
    final RegisterAdressStore _registerAdressStore =
        RegisterAdressStore(adressArguments: registerAdressArguments);

    return Scaffold(
      appBar: AppBar(
        title: Text('Register Adress'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _registerAdressStore.ufController,
                      decoration: InputDecoration(
                        hintText: 'UF',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _registerAdressStore.bairroController,
                      decoration: InputDecoration(
                        hintText: 'Bairro',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _registerAdressStore.logController,
                      decoration: InputDecoration(
                        hintText: 'Logradouro',
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        _registerAdressStore.getAdress();
                      },
                      child: Text('Pesquisar'),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Observer(
                        builder: (_) {
                          try {
                            if (_registerAdressStore.loading) {
                              return CircularProgressIndicator();
                            } else {
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
                                  DataColumn(label: Text('Selecionado')),
                                ],
                                rows: _registerAdressStore.adressShared!
                                    .map((item) {
                                  bool isSelected = _registerAdressStore
                                      .adressSave!
                                      .contains(item);

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
                                          _registerAdressStore
                                              .selectAdress(item);
                                        },
                                      ),
                                    ),
                                    DataCell(isSelected
                                        ? IconButton(
                                            icon: Icon(Icons.check_circle,
                                                color: Colors.green),
                                            onPressed: () {
                                              _registerAdressStore
                                                  .selectAdress(item);
                                            },
                                          )
                                        : IconButton(
                                            icon: Icon(Icons.check_circle,
                                                color: Colors.grey),
                                            onPressed: () {
                                              _registerAdressStore
                                                  .selectAdress(item);
                                            },
                                          )),
                                  ]);
                                }).toList(),
                              );
                            }
                          } catch (e, stackTrace) {
                            print('Error in Observer builder: $e\n$stackTrace');
                            return Text('Error occurred');
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                         

                          Get.to(() => AdressPage(
                                adressArguments:
                                    _registerAdressStore.adressSave,
                              ));
                        },
                        child: Text('Salvar'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
