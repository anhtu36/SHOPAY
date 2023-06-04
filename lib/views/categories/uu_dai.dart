import 'package:flutter/material.dart';

class UuDai extends StatefulWidget {
  const UuDai({super.key});

  @override
  State<UuDai> createState() => _UuDaiState();
}

class _UuDaiState extends State<UuDai> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ưu đãi'),),
    );
  }
}