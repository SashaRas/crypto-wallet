import 'package:fire_book/api/get_currency.dart';
import 'package:fire_book/bloc/bloc_get_currency/bloc/getcurrency_bloc.dart';
import 'package:fire_book/ui/coin_manipulationd.dart';
import 'package:fire_book/ui/homePage.dart';
import 'package:fire_book/ui/loginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const LoginPage(),
        '/homePage': (context) => const HomePage(),
        '/addCoinPage': (context) => const AddCoin(),
      },
      initialRoute: '/',
    );
  }
}
