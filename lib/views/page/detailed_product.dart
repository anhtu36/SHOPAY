import 'package:ecommerce_app/database/database.dart';
import 'package:ecommerce_app/models/cart_model.dart';
import 'package:ecommerce_app/provider/cart_provider.dart';
import 'package:ecommerce_app/views/components/add_cart_button.dart';
import 'package:ecommerce_app/views/components/cart_tabbar.dart';
import 'package:ecommerce_app/views/components/list_product.dart';
import 'package:ecommerce_app/views/components/sign_in_button.dart';
import 'package:ecommerce_app/views/components/size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DetailedProduct extends StatefulWidget {
  final Product product;
  const DetailedProduct({
    super.key,
    required this.product,
  });
  @override
  State<DetailedProduct> createState() => _DetailedProductState();
}

class _DetailedProductState extends State<DetailedProduct> {
  DataHelp data = DataHelp();

  @override
  Widget build(BuildContext context) {
    CartProvider cart = Provider.of<CartProvider>(context);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              // height: size.height,
              child: Stack(
                children: [
                  Image.asset(widget.product.image),
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: size.height * 0.56),
                        height: size.height * 0.35,
                        width: size.height * 0.7,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(35),
                                topRight: Radius.circular(35))),
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: size.height * 0.03,
                            right: size.width * 0.01,
                          ),
                          child: Column(
                            children: [
                              Text(
                                widget.product.name,
                                style: GoogleFonts.roboto(
                                    color: Colors.grey.shade600,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                  NumberFormat.currency(
                                          locale: 'vi', decimalDigits: 0)
                                      .format(widget.product.price),
                                  style: GoogleFonts.poppins(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizeProducts(),
                  Padding(
                    padding: EdgeInsets.only(
                        top: size.height * 0.82, left: size.width * 0.09),
                    child: SizedBox(
                      height: size.height / 14,
                      width: size.width / 1.2,
                      child: SignInButton(
                          size: size,
                          text: 'Add to cart',
                          onTap: () {
                            data
                                .insert(Cart(
                              id: widget.product.name.hashCode,
                              productId:
                                  widget.product.name.hashCode.toString(),
                              productName: widget.product.name,
                              initialPrice: widget.product.price,
                              productPrice: widget.product.price,
                              quantity: 1,
                              image: widget.product.image,
                            ))
                                .then((value) {
                              cart.addTotalPrice(double.parse(
                                  widget.product.price.toString()));

                              cart.addCounter();
                              const snackBar = SnackBar(
                                backgroundColor: Colors.green,
                                content: Text('Product is added to cart'),
                                duration: Duration(seconds: 1),
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }).onError((error, stackTrace) {
                              const snackBar = SnackBar(
                                  backgroundColor: Colors.red,
                                  content:
                                      Text('Product is already added in cart'),
                                  duration: Duration(seconds: 1));

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            });
                          }),
                    ),
                  ),
                  const TabBarCart(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
