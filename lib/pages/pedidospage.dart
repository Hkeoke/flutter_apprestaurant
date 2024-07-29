// ignore_for_file: prefer_const_constructors, prefer_is_empty, prefer_const_literals_to_create_immutables, unused_local_variable, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_apprestaurant/carrito/carrito.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PedidosPage extends StatefulWidget {
  const PedidosPage({super.key});

  @override
  State<PedidosPage> createState() => _PedidosPageState();
}

class _PedidosPageState extends State<PedidosPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Carrito>(builder: (context, carrito, child) {
      return Scaffold(
          backgroundColor: Colors.orange,
          appBar: AppBar(
            title: const Text('Pedidos:'),
            backgroundColor: Colors.orange,
          ),
          body: SingleChildScrollView(
            child: Container(
              child: carrito.items.length == 0
                  ? Center(
                      child: Text('Carrito Vacio'),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        for (var item in carrito.items.values)
                          Card(
                            margin: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/images/${item.imagen}',
                                  width: 100,
                                ),
                                Expanded(
                                    child: Container(
                                  padding: EdgeInsets.all(5),
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    //mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        item.nombre,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                          'precio: ${item.precio.toString()} | cantidad: ${item.unidad}'),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            width: 50,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Colors.orange,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30))),
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.remove,
                                                size: 13,
                                                color: Colors.white,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  carrito
                                                      .decrementarCantidadDeItems(
                                                          item.id);
                                                });
                                              },
                                            ),
                                          ),
                                          Container(
                                            width: 20,
                                            child: Center(
                                              child: Text(
                                                  item.cantidad.toString()),
                                            ),
                                          ),
                                          Container(
                                            width: 50,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Colors.orange,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30))),
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.add,
                                                size: 13,
                                                color: Colors.white,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  carrito
                                                      .incrementarCantidadDeItems(
                                                          item.id);
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                                Container(
                                  height: 100,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color:
                                          Color.fromARGB(179, 226, 221, 221)),
                                  child: Center(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Precio :'),
                                      Text((item.precio * item.cantidad)
                                          .toStringAsFixed(2)),
                                    ],
                                  )),
                                )
                              ],
                            ),
                          ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text('Subtotal :'),
                              ),
                              Text('${carrito.subTotal.toStringAsFixed(2)} cup')
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text('Impuesto del 10% :'),
                                ),
                                Text(
                                    '${carrito.impuesto.toStringAsFixed(2)} cup')
                              ],
                            )),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text('Total a pagar :'),
                              ),
                              Text('${carrito.total.toStringAsFixed(2)} cup')
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: FloatingActionButton(
                              backgroundColor: Colors.white,
                              onPressed: () async {
                                String pedido = '';
                                carrito.items.forEach((key, value) {
                                  pedido =
                                      '$pedido${value.nombre}CANTIDAD : ${value.cantidad.toString()} Precio unitario ${value.precio.toString()}Precio total ${(value.cantidad * value.precio).toStringAsFixed(2)}\n';
                                });
                                pedido =
                                    '$pedido SUBTOTAL: ${carrito.subTotal.toStringAsFixed(2)}';
                                pedido =
                                    '$pedido IMPUESTO: ${carrito.impuesto.toStringAsFixed(2)}';
                                pedido =
                                    '$pedido TOTAL: ${carrito.total.toStringAsFixed(2)}';
                                // vincular a whatsapp
                                String numero = '+5358538342';
                                String mng = pedido;

                                final url = Uri.parse(
                                    'https://wa.me/$numero?text=${Uri.encodeFull(mng)}');
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                } else {
                                  throw ('no se pudo enviar pedido');
                                }
                              },
                              child: const Icon(
                                Icons.send,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ));
    });
  }
}
