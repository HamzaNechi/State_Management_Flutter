import 'package:flutter/material.dart';
import 'package:inheritedwidget/home.dart';
import 'package:inheritedwidget/shoppingcart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ShoppingCart(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.red
          )
        ),
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}

