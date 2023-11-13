import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:teste_7_pay/src/ui/pages/adressPage/adress_page.dart';
import 'package:teste_7_pay/src/ui/pages/adressRegistrationPage/adress_register_page.dart';
import 'package:teste_7_pay/src/ui/pages/loginPage/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '7 Pay',
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('pt', 'BR'),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => LoginPage(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/adress-page',
          page: () => const AdressPage(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/register-adress-page',
          page: () => const RegisterAdressPage(),
          transition: Transition.fadeIn,
        ),
      ],
    );
  }
}
