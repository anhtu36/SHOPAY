import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBarr extends StatefulWidget {
  const SearchBarr({super.key});

  @override
  State<SearchBarr> createState() => _SearchBarrState();
}

class _SearchBarrState extends State<SearchBarr> {
  final TextEditingController search = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    search;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          height: size.height / 16,
          width: size.width / 1.5,
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .01, vertical: size.height * .01),
          margin: EdgeInsets.symmetric(
              horizontal: size.width / 20, vertical: size.height / 35),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Color.fromRGBO(200, 168, 201, 0.3),
                    blurRadius: 20,
                    offset: Offset(0, 10)),
              ],
              borderRadius: BorderRadius.circular(15)),
          child: TextFormField(
            controller: search,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search_rounded),
              prefixIconColor: Colors.grey.shade300,
              hintText: 'Search items',
              hintStyle: GoogleFonts.quicksand(color: Colors.grey),
              border: InputBorder.none,
            ),
          ),
        ),
        Container(
          height: size.height / 10,
          width: size.width / 6,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(200, 168, 201, 0.3),
                  blurRadius: 25,
                  offset: Offset(0, 10)),
            ],
          ),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                image: AssetImage(
                  'assets/images/adjust (1).png',
                ),
              )),
        ),
        // ),
        // Container(
        //   height: size.height / 16,
        //   width: size.width / 6,
        //   decoration: BoxDecoration(
        //     color: Colors.black,
        //     borderRadius: BorderRadius.circular(15),
        //     boxShadow: const [
        //       BoxShadow(
        //           color: Color.fromRGBO(200, 168, 201, 0.3),
        //           blurRadius: 25,
        //           offset: Offset(0, 10)),
        //     ],
        //   ),
        //   child: IconButton(onPressed: () {

        //   }, icon: Image(image: AssetImage('assets/images/equalizer.png'),)),
        // ),
      ],
    );
  }
}
