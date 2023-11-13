import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:teste_7_pay/src/ui/pages/adressRegistrationPage/adress_register_page.dart';

import '../../../data/models/address_model.dart';
import '../../../presentation/presenters/adressScore/address_store.dart';
import '../../widgets/drawer_widget.dart';
import 'components/data_table_adress_widget.dart';

class AdressPage extends StatelessWidget {
  final List<AdressModel>? adressArguments;

  const AdressPage({Key? key, this.adressArguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AdressStore adressStore =
        AdressStore(adressArguments: adressArguments);

    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth < 600;

    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(adressStore, isSmallScreen, context),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF393939),
      title: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 80),
        child: Text('Seja Bem-Vindo'),
      ),
      actions: [
        buildAppBarIcon(Icons.settings, () {}),
        buildAppBarIcon(Icons.notifications, () {}),
        buildAppBarIcon(Icons.exit_to_app, () {}),
      ],
    );
  }

  IconButton buildAppBarIcon(IconData icon, VoidCallback onPressed) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
    );
  }

  Widget buildBody(
      AdressStore adressStore, bool isSmallScreen, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DrawerWidget(isSmallScreen: isSmallScreen),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeader(isSmallScreen),
                buildFilterContainer(adressStore, context),
                buildDataTableSection(adressStore, context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildHeader(bool isSmallScreen) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 12, right: 8),
      child: Text(
        'Endereço',
        style: TextStyle(
          fontSize: isSmallScreen ? 18.0 : 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildFilterContainer(AdressStore adressStore, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),
            buildExpandedTextField(
              controller: adressStore.bairroController,
              hintText: 'Bairro',
            ),
            const SizedBox(width: 10),
            buildExpandedTextField(
              controller: adressStore.ufController,
              hintText: 'UF',
            ),
            const SizedBox(width: 10),
            buildElevatedButton('Filtrar', adressStore.filterAdress, context),
            const SizedBox(width: 10),
            buildElevatedButton('Cadastrar', () {
              Get.to(() => RegisterAdressPage(
                    registerAdressArguments: adressArguments,
                  ));
            }, context),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }

  Widget buildExpandedTextField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return Expanded(
      child: Observer(
        builder: (_) => TextField(
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
    );
  }

  Widget buildElevatedButton(
      String text, VoidCallback onPressed, BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF393939),
      ),
      child: Text(text),
    );
  }

  Widget buildDataTableSection(AdressStore adressStore, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 140),
      child: Observer(
        builder: (_) {
          if (adressStore.loading) {
            return const CircularProgressIndicator();
          } else {
            List<AdressModel>? data =
                adressStore.filteredAdress ?? adressArguments;
            return buildDataTable(data, context);
          }
        },
      ),
    );
  }
}
