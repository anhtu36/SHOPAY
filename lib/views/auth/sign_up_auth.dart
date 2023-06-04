import 'package:ecommerce_app/utils/utils.dart';
import 'package:ecommerce_app/view_models/auth_view_model.dart';
import 'package:ecommerce_app/views/auth/sign_in_auth.dart';
import 'package:ecommerce_app/views/components/input_field.dart';
import 'package:ecommerce_app/views/components/sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpAuth extends StatefulWidget {
  const SignUpAuth({super.key});

  @override
  State<SignUpAuth> createState() => _SignUpAuthState();
}

class _SignUpAuthState extends State<SignUpAuth> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(179, 228, 242, 248),
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              Column(
                children: [
                  Row(children: [
                    Container(
                      alignment: Alignment.topLeft,
                      width: size.width / 12,
                      height: size.height / 12,
                      child: IconButton(
                          onPressed: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SignInWithGoogle(),
                              )),
                          icon: Image.asset(
                            'assets/images/x.png',
                          )),
                    ),
                    SizedBox(
                      width: size.width / 1.5,
                    ),
                  ]),
                  SizedBox(height: size.height * .01),

                  // padding: EdgeInsets.only(right: size.width / 1.4),
                  Column(
                    children: [
                      Text(
                        'Sign Up',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Please sign up to your account.',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * .01),
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
                            text: _nameController,
                            hint: "Username",
                            obscureText: false),
                        SizedBox(height: size.height * .03),
                        InputField(
                            size: size,
                            text: _phoneNumController,
                            hint: "Phone number",
                            obscureText: false),
                        SizedBox(height: size.height * .03),
                        InputField(
                            size: size,
                            text: _emailController,
                            hint: "Email",
                            obscureText: false),
                        SizedBox(height: size.height * .03),
                        InputField(
                            size: size,
                            text: _passwordController,
                            hint: "Password",
                            obscureText: true),
                        SizedBox(height: size.height * .05),
                        SignInButton(
                            size: size,
                            onTap: () {
                              _handleSignUp();
                            },
                            text: 'Continue to Sign In'),
                        SizedBox(height: size.height * .03),
                        InkWell(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignInWithGoogle(),
                          )),
                          child: Text(
                            'Already have an account? Sign in.',
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
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

  void _handleSignUp() async {
    if (_nameController.text.isEmpty &&
        _phoneNumController.text.isEmpty &&
        _emailController.text.isEmpty &&
        _passwordController.text.isEmpty) {
      Utils.flushBarErrorMessage('Please fill your field!', context);
    } else if (_phoneNumController.text.isEmpty) {
      Utils.flushBarErrorMessage('Please enter your phonenumber !', context);
    } else if (_emailController.text.isEmpty) {
      Utils.flushBarErrorMessage('Please enter your email !', context);
    } else if (_passwordController.text.isEmpty) {
      Utils.flushBarErrorMessage('Please enter your password !', context);
    } else if (_passwordController.text.length < 6) {
      Utils.flushBarErrorMessage(
          'Please enter at least 6 digit password!', context);
    } else if (_nameController.text.isEmpty &&
        _phoneNumController.text.isEmpty &&
        _emailController.text.isEmpty &&
        _passwordController.text.isEmpty) {
      Utils.flushBarErrorMessage('Please fill your field!', context);
    } else {
      if (_nameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty) {
        setState(() {
          isLoading = true;
        });
        createAccount(_nameController.text, _phoneNumController.text,
                _emailController.text, _passwordController.text)
            .then((user) {
          if (user != null) {
            setState(() {
              isLoading = false;
            });
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => SignInWithGoogle()));
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
