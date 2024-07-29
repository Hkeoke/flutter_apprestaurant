import 'package:flutter/material.dart';
import 'package:flutter_apprestaurant/carrito/carrito.dart';
import 'package:flutter_apprestaurant/pages/principalpage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Carrito(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurante',
      theme: ThemeData(),
      home: PrincipalPage(),
    );
  }
}
