import 'package:ecommerce_app/database/database.dart';
import 'package:ecommerce_app/provider/cart_provider.dart';
import 'package:ecommerce_app/views/components/list_product.dart';
import 'package:ecommerce_app/views/components/size.dart';
import 'package:ecommerce_app/views/page/detailed_product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PopularList extends StatefulWidget {
  const PopularList({super.key});

  @override
  State<PopularList> createState() => _PopularListState();
}

class _PopularListState extends State<PopularList> {
  @override
  Widget build(BuildContext context) {
    final ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    List<Product> products = productProvider.products;

    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .3,
      width: size.width * .1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          Product product = products[index];
          return InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailedProduct(
                product: product,
              ),
            )),
            child: Container(
              margin: EdgeInsets.only(
                  left: size.width * .06,
                  right: size.width * .02), // Adjust the margin spacing
              height: size.height * .6,
              width: size.width * .4,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      product.image,
                      // height: size.height * .2,
                      // width: size.width * .3,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    product.name,
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade800),
                  ),
                  Text(
                    NumberFormat.currency(locale: 'vi', decimalDigits: 0)
                        .format(product.price),
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
    //);
  }
}
