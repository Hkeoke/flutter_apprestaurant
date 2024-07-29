// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_apprestaurant/pages/cartapage.dart';

class PrincipalPage extends StatefulWidget {
  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Restaurante Cubano'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
                child: Align(
              alignment: FractionalOffset.bottomRight,
              child: Container(
                padding:
                    EdgeInsets.only(right: 15, left: 15, top: 50, bottom: 50),
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(200))),
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "La mejor comida criolla!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 5),
                    ),
                  ),
                ),
              ),
            )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Image.asset(
                    "assets/images/logo_restaurante.png",
                    width: MediaQuery.of(context).size.width / 2,
                    height: 200,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 100)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(13.0),
                    shape: const CircleBorder(),
                    backgroundColor: Colors.orange, // color de fondo
                    foregroundColor: Colors.white, // color del icono
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartaPage()),
                    );
                  },
                  child: const Icon(
                    Icons.chevron_right,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
