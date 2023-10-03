import 'package:flutter/material.dart';
import 'package:meuappflutter/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //retira faixa debug
      title: 'Meu APP',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xFF1E1E1E),
        ),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF1E1E1E),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Color(0xFF979797),
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
