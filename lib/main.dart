import 'package:flutter/material.dart';
import 'package:educa_mobile/screens/login_page.dart';
import 'package:educa_mobile/screens/home_page.dart';  // importe a home_page aqui

void main() {
  runApp(const PortalAlunoApp());
}

class PortalAlunoApp extends StatelessWidget {
  const PortalAlunoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home_page': (context) => const PortalAlunoHome(),  // a HomePage que você criou na home_page.dart
      },
    );
  }
}
