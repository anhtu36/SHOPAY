import 'package:ecommerce_app/provider/cart_provider.dart';
import 'package:ecommerce_app/views/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartAppBar extends StatefulWidget {
  const CartAppBar({super.key});

  @override
  State<CartAppBar> createState() => _CartAppBarState();
}

class _CartAppBarState extends State<CartAppBar> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
                  onPressed: () { Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePages(),
              ));},
                  icon: const Image(
                    image: AssetImage('assets/images/left.png'),
                  ),
                ),
              ),
              Text(
                'Cart',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
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
                  onPressed: () {},
                  icon: const Image(
                    image: AssetImage('assets/images/dots.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
