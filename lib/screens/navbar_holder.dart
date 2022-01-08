import 'package:flutter/material.dart';
import 'package:rev/screens/bibliotheque.dart';
import 'package:rev/screens/panier.dart';
import 'package:rev/screens/store.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      drawer: Drawer(
        child: SafeArea(
          child: ListTile(
            title: Row(
              children: const [
                Icon(Icons.power_settings_new),
                SizedBox(
                  width: 10,
                ),
                Text("Se déconnecter"),
              ],
            ),
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove("userId");
              Navigator.pushReplacementNamed(context, "/signIn");
            },
          ),
        ),
      ),
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
