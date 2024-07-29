import 'package:flutter/material.dart';
import 'package:flutter_apprestaurant/models/item.dart';

class Carrito extends ChangeNotifier {
  Map<String, Item> _items = {};
  Map<String, Item> get items {
    return {..._items};
  }

  int get numeroItems {
    return _items.length;
  }

  double get subTotal {
    var total = 0.0;
    items.forEach((key, value) => total += value.precio * value.cantidad);
    return total;
  }

  double get impuesto {
    //10%
    var total = 0.0;
    total = subTotal * 0.10;
    return total;
  }

  double get total {
    var total = 0.0;
    total = subTotal + impuesto;
    return total;
  }

  void agregarItems(String productoId, String nombre, double precio,
      String unidad, String imagen, int cantidad) {
    if (_items.containsKey(productoId)) {
      _items.update(
          productoId,
          (old) => Item(old.id, old.nombre, old.precio, old.unidad, old.imagen,
              old.cantidad + 1));
    } else {
      _items.putIfAbsent(productoId,
          () => Item(productoId, nombre, precio, unidad, imagen, 1));
    }
  }

  void removerItems(String productoId) {
    _items.remove(productoId);
  }

  void incrementarCantidadDeItems(String productoId) {
    if (_items.containsKey(productoId)) {
      _items.update(
          productoId,
          (old) => Item(old.id, old.nombre, old.precio, old.unidad, old.imagen,
              old.cantidad + 1));
    }
  }

  void decrementarCantidadDeItems(String productoId) {
    if (!_items.containsKey(productoId)) {
      return;
    }
    if (_items[productoId]!.cantidad > 1) {
      _items.update(
          productoId,
          (old) => Item(old.id, old.nombre, old.precio, old.unidad, old.imagen,
              old.cantidad - 1));
    } else {
      _items.remove(productoId);
    }
  }

  void removerCarrito() {
    _items = {};
  }
}
