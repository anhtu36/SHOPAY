import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SizeProducts extends StatefulWidget {
  const SizeProducts({super.key});

  @override
  State<SizeProducts> createState() => _SizeProductsState();
}

class _SizeProductsState extends State<SizeProducts> {
  final List<String> sizeList = ['S', 'M', 'L', 'XL', 'XXL'];
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.7, left: size.width * 0.12),
      child: Column(
        children: [
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: selectedIndex == index
                              ? Colors.black
                              : Colors.grey.shade200,
                        ),
                        child: Center(
                          child: Text(
                            sizeList[index],
                            style: GoogleFonts.robotoMono(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  // fontSize: 15,
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black54),
                            ),
                          ),
                        ),
                      ),
                    ),
                separatorBuilder: (_, index) => const SizedBox(width: 10),
                itemCount: sizeList.length),
          ),
        ],
      ),
    );
  }
}
