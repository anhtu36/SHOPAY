import 'package:ecommerce_app/provider/cart_provider.dart';
import 'package:ecommerce_app/provider/user_provider.dart';
import 'package:ecommerce_app/view_models/google_view_model.dart';
import 'package:ecommerce_app/views/components/list_product.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartProvider>(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider<ProductProvider>(
          create: (_) => ProductProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider())
      ],
      child: Builder(builder: (context) {
        return SafeArea(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: GoogleService().handleAuthState(),
          ),
        );
      }),
    );
  }
}
