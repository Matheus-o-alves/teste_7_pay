import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:teste_7_pay/src/ui/pages/adressPage/adress_page.dart';
import 'package:teste_7_pay/src/ui/pages/adressRegistrationPage/adress_register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Framework E-Commerce',
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('pt', 'BR'),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => AdressPage(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/register-adress-page',
          page: () => RegisterAdressPage(),
          transition: Transition.fadeIn,
        ),
      ],
    );
  }
}
