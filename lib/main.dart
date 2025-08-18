import 'package:flutter/material.dart';
import 'package:kel5_ppkdb3/kel5/views/login_screen.dart';
import 'package:kel5_ppkdb3/kel5/views/produk_list_screen.dart';
import 'package:kel5_ppkdb3/kel5/views/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'screens/login_screen.dart';
// import 'screens/product_list_screen.dart';
// import 'screens/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> _checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manajemen Produk',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FutureBuilder<bool>(
        future: _checkLogin(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();
          return snapshot.data!
              ? const ProductListScreen()
              : const LoginScreen();
        },
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/products': (context) => const ProductListScreen(),
      },
    );
  }
}
