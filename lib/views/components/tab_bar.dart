import 'package:ecommerce_app/views/categories/best_product.dart';
import 'package:ecommerce_app/views/categories/for_him.dart';
import 'package:ecommerce_app/views/categories/new_product.dart';
import 'package:ecommerce_app/views/categories/uu_dai.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabBarr extends StatefulWidget {
  const TabBarr({super.key});

  @override
  State<TabBarr> createState() => _TabBarrState();
}

class _TabBarrState extends State<TabBarr> {
  List<String> categories = ['FOR HIM', 'NEW', 'BEST', 'Ưu đãi'];
  List<Widget> pages = const [ForHim(), NewProduct(), BestProduct(), UuDai()];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * .05, vertical: size.height * .04),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            categories.length,
            (index) {
              return Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => pages[index],
                        ),
                      );
                    },
                    child: Container(
                      height: size.height / 18,
                      width: size.width / 4,
                      margin: const EdgeInsets.only(
                          bottom:
                              8.0), // Adjust the value to create the desired space

                      decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? Colors.black
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(18),
                        // boxShadow: const [
                        //     BoxShadow(
                        //         color: Color.fromRGBO(200, 168, 201, 0.3),
                        //        blurRadius: 25,
                        //         offset: Offset(10, 20)
                        //         ),
                        //   ],
                      ),
                      child: Center(
                          child: Text(categories[index].toUpperCase(),
                              style: GoogleFonts.poppins(
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black54,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600))),
                    ),
                  ),
                  SizedBox(
                    width: size.width * .08,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
