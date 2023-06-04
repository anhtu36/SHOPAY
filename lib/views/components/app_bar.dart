import 'package:ecommerce_app/provider/cart_provider.dart';
import 'package:ecommerce_app/views/components/drawer_menu.dart';
import 'package:ecommerce_app/views/page/account_page.dart';
import 'package:ecommerce_app/views/page/cart_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppBarr extends StatefulWidget {
  const AppBarr({super.key});

  @override
  State<AppBarr> createState() => _AppBarrState();
}

class _AppBarrState extends State<AppBarr> {
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
                  onPressed: () {},
                  icon: const Image(
                    image: AssetImage('assets/images/menu.png'),
                  ),
                ),
              ),
              Text(
                'SHOPAY',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AccountPage(),
                        ));
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      FirebaseAuth.instance.currentUser?.photoURL ?? ""),
                  radius: 25,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: size.height * .05, left: size.width * .04),
          // padding: EdgeInsets.symmetric(
          //     horizontal: size.width * .03, vertical: size.height * .05),
          child: Text(
            'Discover\nour new items ',
            style: GoogleFonts.poppins(
                color: Colors.black, fontSize: 28, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
