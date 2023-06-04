import 'package:ecommerce_app/view_models/google_view_model.dart';
import 'package:ecommerce_app/views/page/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    FirebaseAuth.instance.currentUser?.photoURL ?? ""),
                radius: 40,
              ),
              Text(FirebaseAuth.instance.currentUser?.displayName ?? ""),
              const SizedBox(
                height: 10,
              ),
              Text(FirebaseAuth.instance.currentUser?.email ?? ""),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  GoogleService().signOut().then((_) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ));
                  });
                },
                child: const Text('LogOut'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
