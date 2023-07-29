import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String name;
  final int quantity;
  final double price;

  CartItem(
      {@required this.name,
      @required this.id,
      @required this.quantity,
      @required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var tot = 0.0;
    _items.forEach((key, item) {
      tot += item.price * item.quantity;
    });
    return tot;
  }

  void addItem(String prodid, String name, double price) {
    if (_items.containsKey(prodid)) {
      _items.update(
          prodid,
          (existingCartItem) => CartItem(
              name: existingCartItem.name,
              id: existingCartItem.id,
              quantity: existingCartItem.quantity + 1,
              price: existingCartItem.price));
    } else {
      _items.putIfAbsent(
          prodid,
          () => CartItem(
              name: name,
              id: DateTime.now().toString(),
              quantity: 1,
              price: price
              )
          );
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void removeSingleItem(String id) {
    if (!_items.containsKey(id)) {
      return;
    }
    if (_items[id].quantity > 1) {
      _items.update(
          id,
          (existingCartItem) => CartItem(
              name: existingCartItem.name,
              id: existingCartItem.id,
              quantity: existingCartItem.quantity - 1,
              price: existingCartItem.price));
      notifyListeners();
    }
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
