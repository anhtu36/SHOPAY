import 'package:ecommerce_app/database/database.dart';
import 'package:ecommerce_app/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  DataHelp db = DataHelp();
  int _counter = 0;
  int get counter => _counter >= 0 ? _counter : 0;
  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice >= 0.0 ? _totalPrice : 0.0;
  late Future<List<Cart>> _cart;
  Future<List<Cart>> get cart => _cart;
  Future<List<Cart>> getData() async {
    _cart = db.getCartList();
    return _cart;
  }

  void _setPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_item', _counter);
    prefs.setDouble('total_price', _totalPrice);
    notifyListeners();
  }

  void _getPrefItems() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  _counter = prefs.getInt('cart_item') ?? 0;
  if (_counter < 0) {
    _counter = 0;
  }
  _totalPrice = prefs.getDouble('total_price') ?? 0.0;
  if (_totalPrice < 0) {
    _totalPrice = 0.0;
  }
  notifyListeners();
}



  void addTotalPrice(double productPrice) {
    _totalPrice = _totalPrice + productPrice;
    _setPrefItems();
    notifyListeners();
  }

  void removeTotalPrice(double productPrice) {
    _totalPrice = _totalPrice - productPrice;
    _setPrefItems();
    notifyListeners();
  }

  double getTotalPrice() {
    _getPrefItems();
    return _totalPrice;
  }

  void addCounter() {
    _counter++;
    _setPrefItems();
    notifyListeners();
  }

  void removeCounter() {
    _counter--;
    _setPrefItems();
    notifyListeners();
  }

  int getCounter() {
    _getPrefItems();
    return _counter;
  }
}
