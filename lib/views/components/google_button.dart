import 'package:ecommerce_app/view_models/google_view_model.dart';
import 'package:ecommerce_app/views/page/home_page.dart';
import 'package:ecommerce_app/views/components/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleSignInButton extends StatelessWidget {
  final Size size;
  final String text;
  const GoogleSignInButton({super.key, required this.size, required this.text});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return 
    
    GestureDetector(
      onTap: () async {
        await GoogleService().signInWithGoogle().then((_) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePages(),
            ),
          );
        });
      },
      child: Container(
        height: size.height / 14,
        width: size.width / 1.2,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(200, 168, 201, 0.3),
                  blurRadius: 20,
                  offset: Offset(0, 10)),
            ],
            borderRadius: BorderRadius.circular(35)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: size.height / 10,
              width: size.width / 10,
              child: Image.asset(
                'assets/images/google.png',
              ),
            ),
            Text(
              text,
              style: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: size.height / 16,
              width: size.width / 16,
              child: Image.asset(
                'assets/images/right-arrow.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
