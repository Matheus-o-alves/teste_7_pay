import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:teste_7_pay/src/ui/pages/adressPage/adress_page.dart';

import '../../../data/models/address_model.dart';
import '../../../presentation/presenters/registerStore/register_store.dart';
import '../../widgets/drawer_widget.dart';
import '../adressPage/components/data_table_adress_widget.dart';

class RegisterAdressPage extends StatelessWidget {
  final List<AdressModel>? registerAdressArguments;

  const RegisterAdressPage({Key? key, this.registerAdressArguments})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegisterAdressStore registerAdressStore =
        RegisterAdressStore(adressArguments: registerAdressArguments);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF393939),
        title: const Text('Pesquisar e Cadastrar Endereço'),
      ),
      body: Row(
        children: [
          DrawerWidget(isSmallScreen: MediaQuery.of(context).size.width < 600),
          Expanded(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight:
                      MediaQuery.of(context).size.height - kToolbarHeight,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),
                    buildFilterContainer(registerAdressStore, context),
                    const SizedBox(height: 20),
                    buildDataTableWidget(registerAdressStore, context),
                    const SizedBox(height: 20),
                    buildSaveButton(registerAdressStore),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFilterContainer(
      RegisterAdressStore registerAdressStore, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          buildExpandedTextField(
            controller: registerAdressStore.ufController,
            hintText: 'UF',
          ),
          buildExpandedTextField(
            controller: registerAdressStore.bairroController,
            hintText: 'Cidade',
          ),
          buildExpandedTextField(
            controller: registerAdressStore.logController,
            hintText: 'Logradouro',
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                registerAdressStore.getAdress();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFF393939),
              ),
              child: const Text('Filtrar'),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildExpandedTextField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return Expanded(
      child: Observer(
        builder: (_) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.black),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDataTableWidget(
    RegisterAdressStore registerAdressStore,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Observer(
        builder: (_) {
          try {
            if (registerAdressStore.loading) {
              return const CircularProgressIndicator();
            } else if (registerAdressStore.adressShared != null &&
                registerAdressStore.adressShared!.isNotEmpty) {
              return StreamBuilder<List<AdressModel>>(
                  stream: registerAdressStore.selectedAdressListStream,
                  builder: (context, snapshot) {
                    return DataTable(
                      columns: const [
                        DataColumn(label: Text('Cep')),
                        DataColumn(label: Text('Logradouro')),
                        DataColumn(label: Text('Complemento')),
                        DataColumn(label: Text('Bairro')),
                        DataColumn(label: Text('Localidade')),
                        DataColumn(label: Text('Uf')),
                        DataColumn(label: Text('Ibge')),
                        DataColumn(label: Text('Selecionado')),
                      ],
                      rows: registerAdressStore.adressShared!
                          .map((item) => buildDataRow(
                                item,
                                registerAdressStore,
                              ))
                          .toList(),
                    );
                  });
            } else {
              return buildDataTable([], context);
            }
          } catch (e) {
            return const Text('Erro ao buscar endereço');
          }
        },
      ),
    );
  }

  DataRow buildDataRow(
    AdressModel item,
    RegisterAdressStore registerAdressStore,
  ) {
    bool isSelected = registerAdressStore.adressSave.contains(item);

    return DataRow(
      color: isSelected
          ? MaterialStateColor.resolveWith(
              (states) => Colors.green.withOpacity(0.3))
          : null,
      onSelectChanged: (selected) {
        registerAdressStore.selectAdress(item);
      },
      cells: [
        DataCell(Text(item.cep)),
        DataCell(Text(item.logradouro)),
        DataCell(Text(item.complemento)),
        DataCell(Text(item.bairro)),
        DataCell(Text(item.localidade)),
        DataCell(Text(item.uf)),
        DataCell(Text(item.ibge)),
        DataCell(
          Checkbox(
            value: isSelected,
            onChanged: (value) {
              registerAdressStore.selectAdress(item);
            },
            activeColor: Colors.green, // Adiciona a cor verde quando marcado
          ),
        ),
      ],
    );
  }

  Widget buildSaveButton(RegisterAdressStore registerAdressStore) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => AdressPage(
                  adressArguments: registerAdressStore.adressSave,
                ));
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFF393939),
          ),
          child: const Text('Salvar'),
        ),
      ),
    );
  }
}
