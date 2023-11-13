import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
    required this.isSmallScreen,
  }) : super(key: key);

  final bool isSmallScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isSmallScreen ? 60 : 80,
      color: const Color(0xFF393939),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('lib/src/assets/logo-7pay.png'),
          buildIconButton(
            icon: Icons.home,
            color: const Color(0xFFF08F21),
            onPressed: () {
              showInfoDialog(context, '7 Pay',
                  'Esta funcionalidade ainda não está disponível. Para mais informações, visite https://www.use7pay.com.br/');
            },
          ),
          buildIconButton(
            icon: Icons.credit_card,
            color: const Color(0xFFF08F21),
            onPressed: () {
              showInfoDialog(context, '7 Pay',
                  'Esta funcionalidade ainda não está disponível. Para mais informações, visite https://www.use7pay.com.br/');
            },
          ),
          buildIconButton(
            icon: Icons.attach_money,
            color: const Color(0xFFF08F21),
            onPressed: () {
              showInfoDialog(context, '7 Pay',
                  'Esta funcionalidade ainda não está disponível. Para mais informações, visite https://www.use7pay.com.br/');
            },
          ),
          buildIconButton(
            icon: Icons.monetization_on,
            color: const Color(0xFFF08F21),
            onPressed: () {
              showInfoDialog(context, '7 Pay',
                  'Esta funcionalidade ainda não está disponível. Para mais informações, visite https://www.use7pay.com.br/');
            },
          ),
          buildIconButton(
            icon: Icons.receipt,
            color: const Color(0xFFF08F21),
            onPressed: () {
              showInfoDialog(context, '7 Pay',
                  'Esta funcionalidade ainda não está disponível. Para mais informações, visite https://www.use7pay.com.br/');
            },
          ),
          buildIconButton(
            icon: Icons.qr_code,
            color: const Color(0xFFF08F21),
            onPressed: () {
              showInfoDialog(context, '7 Pay',
                  'Esta funcionalidade ainda não está disponível. Para mais informações, visite https://www.use7pay.com.br/');
            },
          ),
        ],
      ),
    );
  }

  Widget buildIconButton({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return IconButton(
      icon: Icon(
        icon,
        color: color,
      ),
      onPressed: onPressed,
    );
  }

  Future<void> showInfoDialog(
      BuildContext context, String title, String message) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(
              color: Color(0xFFF08F21),
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color(0xFF393939),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Color(0xFFF08F21),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
