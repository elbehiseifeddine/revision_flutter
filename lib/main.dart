import 'package:flutter/material.dart';
import 'package:rev/screens/navbar_holder.dart';
import 'package:rev/screens/panier.dart';
import 'package:rev/screens/signin_screen.dart';
import 'package:rev/screens/spash_screen.dart';
import 'package:rev/screens/store.dart';
import 'package:rev/screens/bibliotheque.dart';
import 'package:rev/screens/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SpalshScreen(),
        '/signUp': (context) => SignUp(),
        '/navbar': (context) => NavBar(),
        '/signIn': (context) => Signin(),
      },
    );
  }
}
