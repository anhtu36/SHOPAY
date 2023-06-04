import 'package:flutter/material.dart';

class BestProduct extends StatefulWidget {
  const BestProduct({super.key});

  @override
  State<BestProduct> createState() => _BestProductState();
}

class _BestProductState extends State<BestProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Best'),),
    );
  }
}