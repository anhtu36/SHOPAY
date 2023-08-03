import 'package:ecommerce_app/provider/cart_provider.dart';
import 'package:ecommerce_app/views/page/cart_page.dart';
import 'package:ecommerce_app/views/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TabBarCart extends StatefulWidget {
  const TabBarCart({super.key});

  @override
  State<TabBarCart> createState() => _TabBarCartState();
}

class _TabBarCartState extends State<TabBarCart> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          height: size.height / 18,
          width: size.width / 8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(200, 168, 201, 0.3),
                  blurRadius: 25,
                  offset: Offset(0, 10)),
            ],
          ),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Image(
              image: AssetImage('assets/images/left.png'),
            ),
          ),
        ),
        Badge(
          label: Consumer<CartProvider>(
            builder: (context, value, child) {
              return Text(
                value.getCounter().toString(),
                style: GoogleFonts.quicksand(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              );
            },
          ),
          alignment: Alignment.bottomRight,
          child: Container(
            height: size.height / 18,
            width: size.width / 8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromRGBO(200, 168, 201, 0.3),
                    blurRadius: 25,
                    offset: Offset(0, 10)),
              ],
            ),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartPage(),
                    ));
              },
              icon: const Image(
                image: AssetImage('assets/images/shopping-bag.png'),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
