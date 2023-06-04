import 'package:ecommerce_app/views/auth/sign_in_auth.dart';
import 'package:ecommerce_app/views/auth/sign_up_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height / 8,
            ),
            Column(
              children: [
                SizedBox(
                  height: size.height / 5.5,
                  width: size.width / 0.4,
                  child: Image.asset('assets/images/online-shop.png'),
                ),
                Text(
                  'Shopay',
                  style: GoogleFonts.quicksand(
                      fontSize: 35, fontWeight: FontWeight.bold),
                ),
                Text(
                  'S H O P P I N G  W I T H  S T Y L E',
                  style: GoogleFonts.quicksand(
                      fontSize: 15, fontWeight: FontWeight.w500),
                )
              ],
            ),
            SizedBox(height: size.height / 8),
            Expanded(
                child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(179, 160, 175, 181),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width / 15,
                        vertical: size.height / 15),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: size.width / 3),
                          child: Text(
                            'Welcome back!',
                            style: GoogleFonts.quicksand(
                                fontSize: 29, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: size.height / 30,
                        ),
                        Text(
                          'Sign in with us to find, discover and buy what you need.'
                          ' Inspiring store to buy more.',
                          style: GoogleFonts.quicksand(
                              fontSize: 19, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignInWithGoogle(),
                        )),
                        child: Container(
                          height: size.height / 14,
                          width: size.width / 2.4,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(35)),
                          child: Center(
                            child: Text(
                              'Sign In',
                              style: GoogleFonts.quicksand(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   width: size.width / 15,
                      // ),
                      InkWell(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignUpAuth(),
                        )),
                        child: Container(
                          height: size.height / 14,
                          width: size.width / 2.4,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(35)),
                          child: Center(
                            child: Text(
                              'Sign Up',
                              style: GoogleFonts.quicksand(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
