// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_apprestaurant/carrito/carrito.dart';
import 'package:flutter_apprestaurant/models/menu.dart';
import 'package:flutter_apprestaurant/pages/pedidospage.dart';
import 'package:flutter_apprestaurant/pages/principalpage.dart';
import 'package:provider/provider.dart';

class CartaPage extends StatefulWidget {
  @override
  _CartaPageState createState() => _CartaPageState();
}

class _CartaPageState extends State<CartaPage> {
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          useMaterial3: false,
          // Add your other theme customizations here
        ),
        home: Consumer<Carrito>(builder: (context, carrito, child) {
          return DefaultTabController(
              length: 3,
              child: Scaffold(
                key: _scaffoldMessengerKey,
                backgroundColor: Colors.orange,
                appBar: AppBar(
                  title: Text(
                    'Carta',
                    //  style: TextStyle(color: Colors.black),
                  ),
                  backgroundColor: Colors.orange,
                  elevation: 0,
                  actions: [
                    Stack(
                      children: [
                        IconButton(
                            onPressed: () {
                              carrito.numeroItems != 0
                                  ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PedidosPage()),
                                    )
                                  : ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Agregue productos al carrito'),
                                      ),
                                    );
                            },
                            icon: Icon(Icons.shopping_cart)),
                        Positioned(
                            top: 6,
                            right: 6,
                            child: Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(4)),
                              constraints:
                                  BoxConstraints(minWidth: 14, minHeight: 14),
                              child: Text(
                                carrito.numeroItems.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ))
                      ],
                    )
                  ],
                  bottom: TabBar(
                      labelColor: Colors.deepOrange,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.deepOrange,
                      tabs: [
                        Tab(
                            child: Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Text('Platos'),
                        )),
                        Tab(
                            child: Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Text('Bebidas'),
                        )),
                        Tab(
                            child: Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Text('Postres'),
                        ))
                      ]),
                ),
                drawer: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      UserAccountsDrawerHeader(
                        accountName: Text(""),
                        accountEmail: null,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/logo_restaurante.png"),
                            )),
                      ),
                      InkWell(
                        child: ListTile(
                          title: Text(
                            "Inicio",
                            style: TextStyle(color: Colors.orange),
                          ),
                          leading: Icon(
                            Icons.home,
                            color: Colors.orange,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PrincipalPage()),
                          );
                        },
                      ),
                      InkWell(
                        child: ListTile(
                          title: Text(
                            "Menu",
                            style: TextStyle(color: Colors.orange),
                          ),
                          leading: Icon(
                            Icons.restaurant_menu,
                            color: Colors.orange,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartaPage()),
                          );
                        },
                      ),
                      InkWell(
                        child: ListTile(
                          title: Text(
                            "Carrito",
                            style: TextStyle(color: Colors.orange),
                          ),
                          leading: Icon(
                            Icons.add_shopping_cart,
                            color: Colors.orange,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartaPage()),
                          );
                        },
                      ),
                      InkWell(
                        child: ListTile(
                          title: Text(
                            "Restaurante",
                            style: TextStyle(color: Colors.orange),
                          ),
                          leading: Icon(
                            Icons.restaurant,
                            color: Colors.orange,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartaPage()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: GridView.builder(
                          itemCount: platos.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height / 1.5),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 2,
                          ),
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.orangeAccent,
                                        blurRadius: 30,
                                        offset: Offset(10, 10))
                                  ]),
                              child: Column(
                                children: [
                                  Image.asset(
                                      "assets/images/${platos[index].imagen}"),
                                  Text(
                                    platos[index].nombre,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      'precio: ${platos[index].precio.toString()} cup',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      setState(() {
                                        carrito.agregarItems(
                                            platos[index].id.toString(),
                                            platos[index].nombre,
                                            platos[index].precio,
                                            '1',
                                            platos[index].imagen,
                                            1);
                                      });
                                    },
                                    icon: Icon(Icons.add_shopping_cart),
                                    label: Text('Agregar'),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0))),
                                      elevation: 0,
                                      backgroundColor: Colors.orange,
                                      foregroundColor: Colors
                                          .white, // Set the text/icon color
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: GridView.builder(
                          itemCount: bebidas.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height / 1.5),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 2,
                          ),
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.orangeAccent,
                                        blurRadius: 30,
                                        offset: Offset(10, 10))
                                  ]),
                              child: Column(
                                children: [
                                  Image.asset(
                                      "assets/images/${bebidas[index].imagen}"),
                                  Text(
                                    bebidas[index].nombre,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      'precio: ${bebidas[index].precio.toString()} cup',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      setState(() {
                                        carrito.agregarItems(
                                            bebidas[index].id.toString(),
                                            bebidas[index].nombre,
                                            bebidas[index].precio,
                                            '1',
                                            bebidas[index].imagen,
                                            1);
                                      });
                                    },
                                    icon: Icon(Icons.add_shopping_cart),
                                    label: Text('Agregar'),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0))),
                                      elevation: 0,
                                      backgroundColor: Colors.orange,
                                      foregroundColor: Colors
                                          .white, // Set the text/icon color
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: GridView.builder(
                          itemCount: postres.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height / 1.5),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 2,
                          ),
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.orangeAccent,
                                        blurRadius: 30,
                                        offset: Offset(10, 10))
                                  ]),
                              child: Column(
                                children: [
                                  Image.asset(
                                      "assets/images/${postres[index].imagen}"),
                                  Text(
                                    postres[index].nombre,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      'precio: ${postres[index].precio.toString()} cup',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      setState(() {
                                        carrito.agregarItems(
                                            postres[index].id.toString(),
                                            postres[index].nombre,
                                            postres[index].precio,
                                            '1',
                                            platos[index].imagen,
                                            1);
                                      });
                                    },
                                    icon: Icon(Icons.add_shopping_cart),
                                    label: Text('Agregar'),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0))),
                                      elevation: 0,
                                      backgroundColor: Colors.orange,
                                      foregroundColor: Colors
                                          .white, // Set the text/icon color
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ));
        }));
  }
}
