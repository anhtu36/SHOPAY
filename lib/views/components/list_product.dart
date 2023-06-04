import 'package:flutter/material.dart';

class Product {
  final String name;
  final int price;
  final String image;

  Product({
    required this.name,
    required this.price,
    required this.image,
  });
}

class ProductProvider with ChangeNotifier {
  List<Product> products = [
    Product(
      name: 'Great Life Tee',
      price: 64500,
      image: 'assets/images/a1.JPG',
    ),
    Product(
      name: 'Hen Dress',
      price: 199500,
      image: 'assets/images/a2.JPG',
    ),
    Product(
      name: 'Sunflower Big Tee',
      price: 399000,
      image: 'assets/images/a3.JPG',
    ),
    Product(
      name: 'Great Life Tee/Her',
      price: 64500,
      image: 'assets/images/a4.JPG',
    ),
    Product(
      name: 'Smart Pants',
      price: 419000,
      image: 'assets/images/a5.JPG',
    ),
    Product(
      name: 'Pocket Mini Skirt',
      price: 349000,
      image: 'assets/images/a7.JPG',
    ),
    Product(
      name: 'Wash Polo',
      price: 419000,
      image: 'assets/images/a8.JPG',
    ),
       Product(
      name: 'Fit Pants',
      price: 499000,
      image: 'assets/images/a10.JPG',
    ),
    Product(
      name: 'Sss. Soft Boxer',
      price: 99000,
      image: 'assets/images/a9.JPG',
    ),
    Product(
      name: 'Form Jeans-II',
      price: 499000,
      image: 'assets/images/v10.jpeg',
    ),
    Product(
      name: 'Sunflower Polo Tee',
      price: 399000,
      image: 'assets/images/v1.jpeg',
    ),
  ];
}
