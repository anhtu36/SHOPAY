import 'package:ecommerce_app/utils/utils.dart';
import 'package:ecommerce_app/view_models/auth_view_model.dart';
import 'package:ecommerce_app/views/auth/sign_up_auth.dart';
import 'package:ecommerce_app/views/components/bottom_navigation_bar.dart';
import 'package:ecommerce_app/views/components/facebook_button.dart';
import 'package:ecommerce_app/views/components/google_button.dart';
import 'package:ecommerce_app/views/components/input_field.dart';
import 'package:ecommerce_app/views/page/home_page.dart';
import 'package:ecommerce_app/views/page/sign_in_screen.dart';
import 'package:ecommerce_app/views/components/sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInWithGoogle extends StatefulWidget {
  const SignInWithGoogle({super.key});

  @override
  State<SignInWithGoogle> createState() => _SignInWithGoogleState();
}

class _SignInWithGoogleState extends State<SignInWithGoogle> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(179, 228, 242, 248),
        body:Container(
          width: double.infinity,
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const SignInScreen(),
                                )),
                            icon: const Icon(Icons.arrow_back_rounded)),
                        SizedBox(
                          width: size.width / 1.5,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: size.width / 25),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SignUpAuth(),
                              ));
                            },
                            child: Text(
                              'Register',
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ]),
                  SizedBox(height: size.height * .03),

                  // padding: EdgeInsets.only(right: size.width / 1.4),
                  Column(
                    children: [
                      SizedBox(
                        height: size.height / 10,
                        width: size.width / 1,
                        child: Image.asset('assets/images/profile (1).png'),
                      ),
                      Text(
                        'Sign In',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Please sign in to your account.',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: size.height * .05),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: size.height * .07),
                        InputField(
                            size: size,
                            text: _emailController,
                            hint: "Email",
                            obscureText: false),
                        SizedBox(height: size.height * .02),
                        InputField(
                            size: size,
                            text: _passwordController,
                            hint: "Password",
                            obscureText: true),
                        SizedBox(height: size.height * .02),
                        Padding(
                          padding: EdgeInsets.only(left: size.width * .5),
                          child: Text(
                            'Forgot Password?',
                            style: GoogleFonts.quicksand(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(height: size.height * .03),
                        SignInButton(
                            size: size,
                            onTap: () {
                              _handleLogin();
                            },
                            text: 'Sign In'),
                        SizedBox(height: size.height * .03),
                        Divider(
                          thickness: 10,
                          color: Colors.grey[200],
                        ),
                        SizedBox(height: size.height * .02),
                        isLoading
                            ? Center(
                                child: SizedBox(
                                    height: size.height / 20,
                                    width: size.height / 20,
                                    child: const CircularProgressIndicator(
                                      color: Colors.black,
                                    )))
                            : GoogleSignInButton(
                                size: size, text: 'Continue with Google'),
                        SizedBox(height: size.height * .02),
                        FacebookSignInButton(
                            size: size, text: 'Continue with Facebook'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleLogin() async {
    if (_emailController.text.isEmpty && _passwordController.text.isEmpty) {
      Utils.flushBarErrorMessage('Please fill your field !', context);
    } else if (_emailController.text.isEmpty) {
      Utils.flushBarErrorMessage('Please enter your email !', context);
    } else if (_passwordController.text.isEmpty) {
      Utils.flushBarErrorMessage('Please enter your password !', context);
    } else if (_passwordController.text.length < 6) {
      Utils.flushBarErrorMessage(
          'Please enter at least 6 digit password !', context);
    } else {
      if (_emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty) {
        setState(() {
          isLoading = true;
        });
        signIn(_emailController.text, _passwordController.text).then((user) {
          if (user != null) {
            setState(() {
              isLoading = false;
            });
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const HomePages(),
                ));
          } else {
            setState(() {
              isLoading = false;
            });
          }
        });
      }
    }
  }
}
