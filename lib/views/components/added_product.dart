import 'package:ecommerce_app/database/database.dart';
import 'package:ecommerce_app/models/cart_model.dart';
import 'package:ecommerce_app/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddedProduct extends StatefulWidget {
  const AddedProduct({super.key});

  @override
  State<AddedProduct> createState() => _AddedProductState();
}

class _AddedProductState extends State<AddedProduct> {
  DataHelp data = DataHelp();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    CartProvider cart = Provider.of<CartProvider>(context);
    return FutureBuilder(
      future: cart.getData(),
      builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  const Image(
                    image: AssetImage('assets/images/out-of-stock.png'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Your cart is empty 😌',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Explore products and shop your\nfavourite items',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Expanded(
              child: Container(
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                          left: size.width * .05,
                          right: size.width * .02,
                          top: size.height * .05),
                      height: size.height * 0.14,
                      width: size.width * 0.07,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 110,
                            width: 80,
                            child: Image(
                              image: AssetImage(
                                  snapshot.data![index].image.toString()),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: size.height * 0.04),
                                child: Text(
                                  snapshot.data![index].productName.toString(),
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Text(
                                NumberFormat.currency(
                                        locale: 'vi', decimalDigits: 0)
                                    .format(snapshot.data![index].productPrice),
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  data.delete(snapshot.data![index].id!);
                                  cart.removeCounter();
                                  cart.removeTotalPrice(double.parse(snapshot
                                      .data![index].productPrice
                                      .toString()));
                                },
                                icon: const Image(
                                  height: 25,
                                  width: 25,
                                  image: AssetImage('assets/images/delete.png'),
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      int quantity =
                                          snapshot.data![index].quantity!;
                                      int price =
                                          snapshot.data![index].initialPrice!;
                                      quantity--;
                                      int newPrice = price * quantity;
                                      if (quantity > 0) {
                                        data
                                            .updateQuantity(Cart(
                                                id: snapshot.data![index].id,
                                                productId: snapshot
                                                    .data![index].productId
                                                    .toString(),
                                                productName: snapshot
                                                    .data![index].productName,
                                                initialPrice: snapshot
                                                    .data![index].initialPrice,
                                                productPrice: newPrice,
                                                quantity: quantity,
                                                image: snapshot
                                                    .data![index].image
                                                    .toString()))
                                            .then((value) {
                                          newPrice = 0;
                                          quantity = 0;
                                          cart.removeTotalPrice(double.parse(
                                              snapshot
                                                  .data![index].initialPrice!
                                                  .toString()));
                                        }).onError((error, stackTrace) {
                                          print(error.toString());
                                        });
                                      }
                                    },
                                    icon: const Image(
                                      height: 20,
                                      width: 20,
                                      image: AssetImage(
                                          'assets/images/remove.png'),
                                    ),
                                  ),
                                  Text(
                                    snapshot.data![index].quantity.toString(),
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  IconButton(
                                    onPressed: () { int quantity =
                                          snapshot.data![index].quantity!;
                                      int price =
                                          snapshot.data![index].initialPrice!;
                                      quantity++;
                                      int? newPrice = price * quantity;
                                      if (quantity > 0) {
                                        data
                                            .updateQuantity(Cart(
                                                id: snapshot.data![index].id,
                                                productId: snapshot
                                                    .data![index].productId
                                                    .toString(),
                                                productName: snapshot
                                                    .data![index].productName,
                                                initialPrice: snapshot
                                                    .data![index].initialPrice,
                                                productPrice: newPrice,
                                                quantity: quantity,
                                                image: snapshot
                                                    .data![index].image
                                                    .toString()))
                                            .then((value) {
                                          newPrice = 0;
                                          quantity = 0;
                                          cart.addTotalPrice(double.parse(
                                              snapshot
                                                  .data![index].initialPrice!
                                                  .toString()));
                                        }).onError((error, stackTrace) {
                                          print(error.toString());
                                        });
                                      }},
                                    icon: const Image(
                                      height: 20,
                                      width: 20,
                                      image:
                                          AssetImage('assets/images/add.png'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          }
        }
        return const Text('');
      },
    );
  }
}
