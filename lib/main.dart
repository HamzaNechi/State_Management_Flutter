import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer/repositories/user_repositorie.dart';
import 'package:timer/screens/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          color: Colors.red,
          foregroundColor: Colors.white
        ),
      ),

      debugShowCheckedModeBanner: false,
      home:RepositoryProvider(
        create: (context) => UserRepository(),
        child: const Home()),
    );
  }
}
