import 'package:flutter/material.dart';
import 'package:rev/screens/panier.dart';
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
      initialRoute: '/signUp',
      routes: {
        '/signUp': (context) => SignUp(),
        '/navbar': (context) => NavBar()
      },
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  final List<Widget> _interfaces = [
    Store(),
    Bibliotheque(),
    Panier(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Esprit Store"),
      ),
      body: _interfaces[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: "Store",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Bibliothèque",
            icon: Icon(Icons.article),
          ),
          BottomNavigationBarItem(
            label: "Panier",
            icon: Icon(Icons.shopping_basket_rounded),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (int value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}
