import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:teste_7_pay/src/ui/pages/adressRegistrationPage/adress_register_page.dart';

import '../../../data/models/address_model.dart';
import '../../../presentation/presenters/adressScore/adress_score.dart';
import 'components/data_table_adress_widget.dart';

class AdressPage extends StatelessWidget {
  final List<AdressModel>? adressArguments;

  AdressPage({super.key, this.adressArguments});

  @override
  Widget build(BuildContext context) {
    final AdressStore _adressStore =
        AdressStore(adressArguments: adressArguments);

    return Scaffold(
      appBar: AppBar(
        title: Text('Olá, João'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Ação do ícone de configurações
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Ação do ícone de notificações
            },
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              // Ação do ícone de sair
            },
          ),
        ],
      ),
      body: Row(
        children: [
          Container(
            width: 80,
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    // Ação do ícone home
                  },
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Ação do ícone de pesquisa
                  },
                ),
                IconButton(
                  icon: Icon(Icons.map),
                  onPressed: () {
                    // Ação do ícone de mapa
                  },
                ),
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    // Ação do ícone de pessoa
                  },
                ),
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    // Ação do ícone de configurações
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Endereço',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Observer(
                            builder: (_) => TextField(
                              controller: _adressStore.bairroController,
                              onChanged: (String) {},
                              decoration: InputDecoration(
                                hintText: 'Digite o bairro...',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Observer(
                            builder: (_) => TextField(
                              controller: _adressStore.ufController,
                              onChanged: (String) {},
                              decoration: InputDecoration(
                                hintText: 'Digite o UF...',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            _adressStore.filterAdress();
                          },
                          child: Text('Filtrar'),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Atualizar'),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            Get.to(() => RegisterAdressPage(
                                  registerAdressArguments: adressArguments,
                                ));
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => RegisterAdressPage(
                            //             registerAdressArguments:
                            //                 adressArguments,
                            //           )),
                            // );
                          },
                          child: Text('Cadastrar'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Observer(
                      builder: (_) {
                        try {
                          if (_adressStore.loading) {
                            return CircularProgressIndicator();
                          } else if (_adressStore.filteredAdress != null &&
                              _adressStore.filteredAdress!.isNotEmpty) {
                            List<AdressModel>? filteredData =
                                _adressStore.filteredAdress;
                            return buildDataTable(filteredData);
                          } else {
                            return buildDataTable(adressArguments);
                          }
                        } catch (e, stackTrace) {
                          print('Error in Observer builder: $e\n$stackTrace');
                          return Text('Error occurred');
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
