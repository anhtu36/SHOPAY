import 'package:ecommerce_app/database/database.dart';
import 'package:ecommerce_app/views/components/added_product.dart';
import 'package:ecommerce_app/views/components/cart_appbar.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  DataHelp dataBaseHelp = DataHelp();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children:  [CartAppBar(), AddedProduct()],
    ));
  }
}
